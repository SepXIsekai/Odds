https://classic-subtly-scorpion.ngrok-free.app

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
