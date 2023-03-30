<img align="right" width="300" alt="logo" src="https://user-images.githubusercontent.com/92455101/215042770-66273c82-6889-479e-a2a4-3c1f5a9e1230.png">

# EGreenBin

**The idea**: is a system to help teachers and schools in helping children form awareness from an early age.

> "Together we save the natural world"

## App demo

**Link download apk for android**: [eGreenBin](https://drive.google.com/file/d/1VTPtGCNmN7gW3FWnvPVunL8GQx1P8L8j/view?usp=share_link)

## App UI

<img align="center" width="200" alt="UIApp" src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDIxYTBjYjYxMGMyNDlkN2E0YTM5MTBiNWMwMWI4NGI5ZTE2YTRhMCZjdD1n/IgTrLX9Ou58tmIaUBh/giphy.gif">

## Flow app

![flow](https://user-images.githubusercontent.com/92455101/226181280-a00d09c3-481e-429a-ba62-d6dba93bebcf.jpg)

# Project stucture

- assets
  - animation: chứa các file lotifile, animate
  - icons : chứa các ảnh icon để sử dụng
  - images: chứa các ảnh dùng cho app
  - fonts : chứa fonts chữ của app (không cần lắm do dùng google font)
- app

  - core

    - extensions: chứa các phương thức mở rộng cho các giá trị trong app
    - utils: chứa các hàm xử lí chung cho app
    - languages:
      - en: sub english
      - vi: sub vietnamese
    - values
      - app_string: chứa các string chung của app
      - app_value: chứa các giá trị mặc định cho app
      - image: chứa đường dẫn tới các image
    - theme:
      - app_colors: là nơi định nghĩa màu cho cả app
      - text_styles: là nơi định nghĩa textStyle cho cả app

  - data

    - enums: chứa enum tự định nghĩa
    - models: chứa các models của app
    - providers: nơi cung cấp data (api, database, firebase,...)
    - services: chứa các hàm service của app (https, authen_service,...)

  - global_widgets: chứa các widgets được sử dụng nhiều lần trong app

  - modules

    - <module_name>: được đặt tên theo tên chức năng
      - screens: chứa các trang của tính năng
      - widgets: chứa các local widgets chỉ xuất hiện trong tính năng này
      - <module_name>\_controller.dart: Khởi tạo controller cho tính năng
      - <module_name>\_binding.dart: Định nghĩa các hàm và biến cho controller

  - routes
    - app_pages.dart: dẫn các route đến các trang tương ứng
    - app_routes.dart: chứa tên các route

- main.dart

## How to get this code

```
git clone https://github.com/GDSC-UIT/eGreenBin-mobile-GDSC-Hackathon.git
cd eGreenBin-mobile-GDSC-Hackathon
flutter pub get
```

## Resources

- Design Figma: https://www.figma.com/file/RkQeskWhdVR0k9WSatQ9PY/eGreenBin-App?node-id=0%3A1&t=7N586K5yNSBOIYit-1
- Git: https://github.com/GDSC-UIT/eGreenBin-mobile.git
- Firebase: https://console.firebase.google.com/u/0/project/egreenbin-4eb81/overview
- Reference codebase: https://github.com/kauemurakami/getx_pattern
