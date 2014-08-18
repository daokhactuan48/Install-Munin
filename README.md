# Hướng Dẫn Cài Đặt Munin

### Giới Thiệu 

Munin là một công cụ được sử dụng để giám sát tất cả các máy client, nó thu thập các thông tin từ các máy trạm sau đó biểu diễn lại theo dạng biểu đồ trên giao diện 

Munin có kiến trúc là Master và node. Master sẽ kết nối đến tât cả các node và thu thập dữ liệu. Sau khi thu thập dữ liệu trong file RRD và cập nhật lên biểu đồ. 

### Chuẩn bị cài đặt

Tạm thời chỉ xây dựng 1 con Master và 1 con node
- Master: Cài đặt trên các máy ubuntu server 12.04
- Node  : Tiến hành trên Ubuntu server 14.04
- Thiết lập IP cho Master và Node
- Master: 172.16.69.15/24
- Node  : 172.16.69.29/24

### Tiến hành cài đặt 

#### I.Cài đặt trên Master

B1: Mở 1 máy tính có IP là 172.16.69.15 quyền đăng nhập là root.

B2: Tải gói cài đặt trên github

`wget https://raw.githubusercontent.com/daokhactuan48/Install-Munin/master/munin-master.sh`

B3: Tiến hành chạy file shell 

`bash munin-master.sh`

Trong quá trình chạy file shell nếu có lựa chọn Yes or No thì chọn Yes

B4: Kiểm tra xem đã hoàn thành quá trình cài đặt Munin chưa bằng việc mở trình duyệt ra và gõ địa chỉ sau:

`http://172.16.69.15/munin/`

Hiện tại Munin đang giám sát chính con Master nếu bạn muốn thực hiện giám sát các máy client ta thực hiện ở phần ngay sau đây

#### II. Cài đặt trên Node

B1: Mở 1 máy tính có IP là 172.16.69.29 có quyền đăng nhập là root

B2: Tải gói cài đặt sau trên github

`wget https://raw.githubusercontent.com/daokhactuan48/Install-Munin/master/munin-client.sh`

B3: Tiến hành chạy file shell 

`bash munin-client.sh`

B4: Chuyển sang máy master tải file shell từ github:

`wget https://raw.githubusercontent.com/daokhactuan48/Install-Munin/master/add-client.sh`

B5: Kiểm tra xem đã hoàn thành quá trình cài đặt Munin trên node chưa, phải mất vài phút để load lên web

`http://172.16.69.15/munin/`




