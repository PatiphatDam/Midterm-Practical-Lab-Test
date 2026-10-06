# Campus Equipment Booking API (Midterm Practical Lab Test)

ระบบ REST API สำหรับการจองอุปกรณ์และทรัพยากรส่วนกลางของคณะ (เช่น โปรเจกเตอร์, กล้อง, ห้องประชุม) มีระบบป้องกันการจองเวลาซ้อนทับกัน (Double-Booking Prevention) และใช้ SQL Parameter Binding เพื่อความปลอดภัย

---

## 1. Base API URL

* **Base URL:** `http://localhost:8787/api`

---

## 2. วิธีการติดตั้งและรันโปรเจกต์ (Run Instructions)

### Prerequisites
* Node.js (v18 ขึ้นไป)
* npm / pnpm / yarn
* Wrangler (สำหรับ Cloudflare Workers / D1)

### ขั้นตอนการติดตั้งและตั้งค่า

1. **ติดตั้ง Dependencies:**
   ```bash
   npm install