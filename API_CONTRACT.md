## Assumptions & System Scope
1. **Time Format**: ค่าเวลา `startAt` และ `endAt` ทั้งหมดต้องส่งมาในรูปแบบ ISO 8601 string (เช่น `2026-10-20T09:00:00.000Z`)
2. **Double Booking Definition**: การจองอุปกรณ์ชิ้นเดียวกันจะถือว่าซ้อนทับกัน (Overlap) เมื่อ:
   (ExistingStart < NewEnd) AND (ExistingEnd > NewStart)
3. **Database**: ใช้ SQLite/D1 พร้อมสร้าง Foreign Key Constraint เชื่อมระหว่าง `bookings.equipmentId` และ `equipment.id`
**Base URL:** `http://localhost:8787/api`  
**Content-Type:** `application/json`

---

## 1. Overview of Endpoints

| Method | Endpoint | Description | Success Code | Error Codes |
| :--- | :--- | :--- | :---: | :---: |
| **GET** | `/equipment` | ดึงรายการอุปกรณ์ทั้งหมด | `200 OK` | `500` |
| **GET** | `/bookings` | ดึงรายการจองทั้งหมด | `200 OK` | `500` |
| **GET** | `/bookings/:id` | ดึงข้อมูลการจองตาม ID | `200 OK` | `404`, `500` |
| **POST** | `/bookings` | สร้างรายการจองใหม่ | `201 Created` | `400`, `404`, `409`, `500` |
| **PATCH** | `/bookings/:id` | แก้ไขข้อมูลการจอง | `200 OK` | `400`, `404`, `409`, `500` |
| **DELETE**| `/bookings/:id` | ยกเลิก / ลบรายการจอง | `204 No Content` | `404`, `500` |

---

## 2. Global Error Response Format

ทุกกรณีที่เกิดข้อผิดพลาด (Status Code 4xx / 5xx) ระบบจะคืนค่า JSON รูปแบบเดียวกันทั้งหมด:

```json
{
  "error": "รายละเอียดข้อผิดพลาดที่เข้าใจง่ายสำหรับผู้ใช้งานหรือนักพัฒนา"
}