import pyodbc
server = '172.22.1.83'  # Tên máy chủ SQL Server
database = 'Databases'  # Tên cơ sở dữ liệu
username = 'dangtester'  # Tên đăng nhập SQL Server
password = 'SgNFAeg4tMcviY'  # Mật khẩu SQL Server

# Thiết lập chuỗi kết nối
conn_str = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

# Sử dụng chuỗi kết nối để kết nối đến SQL Server:
conn = pyodbc.connect(conn_str)

cursor = conn.cursor()

cursor.execute('SELECT * FROM AdsCentral')
rows = cursor.fetchall()

# In kết quả
for row in rows:
    print(row)