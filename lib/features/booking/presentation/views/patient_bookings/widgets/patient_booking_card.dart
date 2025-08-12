import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_link/core/constants/app_colors.dart';
import 'package:medi_link/core/constants/font_styles.dart';
import 'package:medi_link/core/models/booking_status.dart';
import 'package:medi_link/core/widgets/custom_button.dart';
import 'package:medi_link/features/booking/domain/entities/booking_entity.dart';
import 'package:medi_link/features/booking/presentation/cubits/booking_cubit.dart';

class PatientBookingCard extends StatelessWidget {
  final BookingEntity booking;

  const PatientBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات الدكتور
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primaryBlue,
                  child: Icon(Icons.medical_services, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'د. ${booking.doctorName}',
                        style: FontStyles.medium15.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'للمريض: ${booking.patientName}',
                        style: FontStyles.light12.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // تاريخ الحجز
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.darkGrey,
                ),
                const SizedBox(width: 8),
                Text(
                  _formatDate(booking.date),
                  style: FontStyles.light12.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // حالة الحجز
            Row(
              children: [
                Icon(
                  BookingStatusHelper.getStatusIcon(booking.status),
                  size: 16,
                  color: BookingStatusHelper.getStatusColor(booking.status),
                ),
                const SizedBox(width: 8),
                Text(
                  BookingStatusHelper.getLocalizedStatus(
                    context,
                    booking.status,
                  ),
                  style: FontStyles.medium15.copyWith(
                    color: BookingStatusHelper.getStatusColor(booking.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // الأزرار حسب الحالة
            _buildPatientActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientActionButtons(BuildContext context) {
    switch (booking.status.toLowerCase()) {
      case 'pending':
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'في انتظار موافقة الدكتور',
                  textAlign: TextAlign.center,
                  style: FontStyles.medium15.copyWith(color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => _showCancelDialog(context),
              text: 'إلغاء',
              width: 80,
              height: 35,
              backgroundColor: Colors.red,
              style: FontStyles.medium15.copyWith(color: Colors.white),
            ),
          ],
        );

      case 'approved':
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'تم قبول الحجز - في انتظار الموعد',
                  textAlign: TextAlign.center,
                  style: FontStyles.medium15.copyWith(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => _showCancelDialog(context),
              text: 'إلغاء',
              width: 80,
              height: 35,
              backgroundColor: Colors.red,
              style: FontStyles.medium15.copyWith(color: Colors.white),
            ),
          ],
        );

      case 'completed':
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              Text(
                'تم إنهاء الحجز بنجاح',
                style: FontStyles.medium15.copyWith(color: Colors.blue),
              ),
            ],
          ),
        );

      case 'rejected':
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cancel, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              Text(
                'تم رفض الحجز من الدكتور',
                style: FontStyles.medium15.copyWith(color: Colors.red),
              ),
            ],
          ),
        );

      case 'cancelled':
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.block, color: Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                'تم إلغاء الحجز',
                style: FontStyles.medium15.copyWith(color: Colors.grey),
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  void _showCancelDialog(BuildContext context) {
    // احفظ reference للـ BookingCubit قبل فتح الـ dialog
    final bookingCubit = context.read<BookingCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        // استخدم اسم مختلف للـ context
        return AlertDialog(
          title: const Text('تأكيد الإلغاء'),
          content: const Text('هل أنت متأكد من إلغاء هذا الحجز؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('لا'),
            ),
            TextButton(
              onPressed: () {
                // استخدم الـ reference المحفوظ بدلاً من context.read
                bookingCubit.cancelBooking(booking.id);
                Navigator.of(dialogContext).pop();
              },
              child: const Text('نعم', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }
}
