<h1 align="center">🏥 MediLink</h1>

<p align="center">
  A healthcare appointment booking app built with Flutter
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/BLoC-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Clean_Architecture-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white" />
</p>

---

## 📱 About

MediLink is a dual-role healthcare platform that connects patients with doctors. Patients can browse doctors, book appointments, and track their status — while doctors can manage incoming requests through a dedicated dashboard.

---

## ✨ Features

### 👤 Patient
- 🔐 **Authentication** — Register and login as a patient
- 🩺 **Browse Doctors** — View available doctors and their profiles
- 📅 **Book Appointments** — Send appointment requests to doctors
- 📊 **Track Status** — Follow up on booking status (pending / accepted / rejected)
- ❌ **Cancel Bookings** — Cancel an appointment at any time
- ❤️ **Favorite Doctors** — Save favorite doctors locally using Hive
- ✏️ **Profile Management** — Update photo, name, email, and phone number

### 🩺 Doctor
- 🔐 **Authentication** — Register and login as a doctor
- 📋 **Dashboard** — View all incoming appointment requests
- ✅ **Accept / Reject** — Manage appointment requests
- ✏️ **Profile Management** — Update personal info and profile photo

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter & Dart |
| State Management | BLoC / Cubit |
| Architecture | Clean Architecture (Data / Domain / Presentation) |
| Networking | REST API |
| Local Database | Hive |
| Backend | Supabase |

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with three main layers:

```
lib/
├── core/                  # Shared utilities, themes, constants
├── features/
│   ├── auth/
│   │   ├── data/          # Models, repositories impl, data sources
│   │   ├── domain/        # Entities, use cases, repository contracts
│   │   └── presentation/  # BLoC, pages, widgets
│   ├── patient/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── doctor/
│       ├── data/
│       ├── domain/
│       └── presentation/
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`

### Installation

```bash
# Clone the repo
git clone https://github.com/HishamElnemr/medi_link.git

# Navigate to project
cd medi_link

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📬 Contact

**Hisham Ahmed El-Nemr**
- LinkedIn: [linkedin.com/in/hishamelnemr](https://www.linkedin.com/in/hishamelnemr/)
- GitHub: [github.com/HishamElnemr](https://github.com/HishamElnemr)
- Email: hishammelnmr@gmail.com
