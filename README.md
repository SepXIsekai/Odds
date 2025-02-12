# Chatapp - Ruby on Rails
ChatApp - https://classic-subtly-scorpion.ngrok-free.app
<br> ลอง Signup ด้วย <br>
Email : test5@test.com <br>
Password : 123456<br>

1 . Clone Repo ลงใน Ubantu<br>
```sh
git clone https://github.com/SepXIsekai/Odds.git
```
2 . Change Directory ไปยังที่ Clone Project ไป<br>

3 . ติดตั้ง bundle
```sh
bundle install
```
4 . ตั้งค่าฐานข้อมูล<br>
```sh
rails db:create
rails db:migrate
rails db:seed (ถ้ามีข้อมูลเริ่มต้น)
```
5 . Run server<br>
```sh
rails server
```
<br>
### ช่วงสารภาพบาป 
<br> เนื่องจากผมไม่รู้ว่าข้อมูลเก่ามันถูก cache ไว้ ต้องล้าง cache แล้ว reset db ใหม่ทำให้
ถ้าพี่ไม่รับผมก็เป็นกรรมของผมที่ไม่ได้ reset db และไม่ได้ดูว่ามัน cache ข้อมูลเอาไว้ทำให้ไม่ได้แก้ให้เสร็จครบถ้วนแล้วต้องมาแก้ใหม่<br>
ทำให้ไม่ได้มาแก้ตอนคนอื่น clone ลงไปแล้วหน้า Login ไม่ direct ไปหน้า chatapp<br>
แล้วก็ turbo stream ไม่ทำงานจนทำให้เข้าช่อง chatapp ไม่ได้ ทำให้ต้องมาแก้หลังจากที่ หมดเวลา assign แล้ว <br>
น้อมรับผิดทุกประการ TT ถ้าพี่ไม่รับไม่เป็นไรครับขอแค่ให้มัน clone ไปแล้วรันได้ก็พอ
