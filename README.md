<img align="right" width="300" alt="logo" src="https://user-images.githubusercontent.com/92455101/215042770-66273c82-6889-479e-a2a4-3c1f5a9e1230.png">

# EGreenBin

**The idea**: is a system to help teachers and schools in helping children form awareness from an early age.

> "Together we save the natural world"

## Project stucture

- assets
  - icons : chứa các ảnh icon để sử dụng
  - images: chứa các ảnh dùng cho app
  - fonts : chứa fonts chữ của app (không cần lắm do dùng google font)
- app
  - core
    - utils: chứa các hàm xử lí chung cho app
    - values
      - languages
    - app_colors: là nơi định nghĩa màu cho cả app
    - text_styles: là nơi định nghĩa textStyle cho cả app
    - app_strings: là nơi chứa các chuỗi của cả app
    - app_values: là nơi chứa các formatter ngày giờ tháng năm
  - data
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

## Resources

- Design Figma: https://www.figma.com/file/RkQeskWhdVR0k9WSatQ9PY/eGreenBin-App?node-id=0%3A1&t=7N586K5yNSBOIYit-1
- Git: https://github.com/GDSC-UIT/eGreenBin-mobile.git
- Firebase: https://console.firebase.google.com/u/0/project/egreenbin-4eb81/overview
- Reference codebase: https://github.com/kauemurakami/getx_pattern
