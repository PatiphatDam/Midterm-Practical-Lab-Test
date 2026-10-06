# Quality Gate Review

## Findings & Improvements

1. **Reliability/Accuracy (Database Integrity & Parameter Binding)**
   - **What was found:** ในตอนออกแบบ query เบื้องต้น มีความเสี่ยงเรื่อง SQL Injection หากนำ string มาต่อกันโดยตรง
   - **How it was fixed:** เปลี่ยนมาใช้ Parameter Binding ผ่าน `.bind(...)` ของ Hono/D1 ทั้งหมดทุก endpoint
   - **Evidence:** การใช้งานคำสั่ง `.prepare('SELECT * FROM bookings WHERE id = ?').bind(id)` ใน `src/index.ts`

2. **Reliability/Accuracy (Time Overlap Logic Validation)**
   - **What was found:** การตรวจจองเวลาซ้ำเดิมใช้การเช็คทีละจุด ทำให้กรณีจองครอบช่วงเวลาเดิมหลุดการตรวจจับ
   - **How it was fixed:** ปรับ Logic เงื่อนไข SQL Overlap ให้เป็น `datetime(startAt) < datetime(newEnd) AND datetime(endAt) > datetime(newStart)`
   - **Evidence:** ป้องกันการเกิด Double Booking ได้ถูกต้อง คืนค่า HTTP 409 Conflict เมื่อทดสอบจองเวลาซ้อน

3. **Reasoning/You Own It (Error Format Uniformity)**
   - **What was found:** ข้อความ Error ดั้งเดิมจากระบบ คืนค่าไม่ตรงกับที่ API Contract กำหนด
   - **How it was fixed:** สร้าง Helper function `errorResponse()` เพื่อให้ทุกกรณีที่เกิด error คืนค่าโครงสร้าง `{ "error": "message" }` พร้อม Status Code 400, 404, 409 ที่ตรงมาตรฐาน
   - **Evidence:** สเปกตอบกลับ JSON ในกรณี Error ทั้งหมดผ่านการครอบด้วย `errorResponse()` ใน `src/index.ts`