# AI Use Log

## Important Prompts & Usage
1. **Prompt:** "ขอออกแบบ REST API contract และ Database ERD สำหรับระบบจองอุปกรณ์"
   - **Used:** โครงสร้าง JSON Payload, SQL Schema และสถานะ HTTP Status Codes
   - **Verification:** ตรวจสอบชื่อฟิลด์ให้ตรงกับโจทย์กำหนด (`equipmentId`, `borrowerName`, `startAt`, `endAt`, `purpose`)

2. **Prompt:** "ขอโค้ด Hono + D1 สำหรับตรวจสอบ Overlap booking และ CRUD operations"
   - **Used:** โค้ดเช็คเวลาซ้อนทับ `(ExistingStart < NewEnd) AND (ExistingEnd > NewStart)`
   - **Verification:** ตรวจสอบว่าใช้ SQL Parameter Binding (`.bind()`) และส่ง Error คืนรูป `{ "error": "message" }` ตามที่กำหนด

3. **Prompt:** "ขอคำสั่ง cURL สำหรับทดสอบ API ทั้งกรณีสำเร็จและล้มเหลว"
   - **Used:** ชุดคำสั่ง cURL ในการทดสอบ
   - **Verification:** รันสั่งจริงใน Terminal และตรวจสอบ Status Code ตอบกลับทุกตัว