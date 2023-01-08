# EGreenBin
 **The idea**: is a system to help teachers and schools in helping children form awareness from an early age.
>"Together we save the natural world"
## Project stucture

- app
    - core
        - utils: chứa các hàm xử lí chung cho app
        - values
            - languages
        - app_colors: là nơi định nghĩa màu cho cả app
        - app_strings: là nơi chứa các chuỗi của cả app
        - app_values: là nơi chứa các formatter ngày giờ tháng năm
    - data
        - models: chứa các models của app
        - services: chứa các hàm service của app (https, authen_service,...)
    - global_widgets: chứa các widgets được sử dụng nhiều lần trong app
    - modules
        - <module_name>: được đặt tên theo tên chức năng
            - screens: chứa các trang của tính năng
            - widgets: chứa các local widgets chỉ xuất hiện trong tính năng này
            - <module_name>_controller.dart: Khởi tạo controller cho tính năng
            - <module_name>_binding.dart: Định nghĩa các hàm và biến cho controller
    - routes
        - app_pages.dart: dẫn các route đến các trang tương ứng
        - app_routes.dart: chứa tên các route
- main.dart

Reference: https://github.com/kauemurakami/getx_pattern
