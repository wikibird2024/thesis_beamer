

I (203) cpu_start: cpu freq: 160000000 Hz
I (203) app_init: Application information:
I (206) app_init: Project name:     sim_4g_gps
I (211) app_init: App version:      fb22cb4-dirty
I (216) app_init: Compile time:     Sep 11 2025 07:45:06
I (222) app_init: ELF file SHA256:  2a20c81cc...
I (228) app_init: ESP-IDF:          v5.5
I (232) efuse_init: Min chip rev:     v0.0
I (237) efuse_init: Max chip rev:     v3.99
I (242) efuse_init: Chip rev:         v3.1
I (247) heap_init: Initializing. RAM available for dynamic allocation:
I (254) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (260) heap_init: At 3FFB2D18 len 0002D2E8 (180 KiB): DRAM
I (266) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
I (273) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
I (279) heap_init: At 4008E070 len 00011F90 (71 KiB): IRAM
W (286) spi_flash: boya detected but related driver is not linked, please check option `SPI_FLASH_SUPPORT_BOYA_CHIP`
I (297) spi_flash: detected chip: generic
I (301) spi_flash: flash io: dio
W (305) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
I (319) main_task: Started on CPU0
I (329) main_task: Calling app_main()
--- Khoi tao he thong va module SIM 4G/GPS ---
I (329) UART_DRIVER: UART initialized

--- Kiem tra ket noi va thong tin module ---
I (829) SIM_4G: Sent command: AT
I (1329) SIM_4G: Received: AT
OK

I (1829) SIM_4G: Sent command: ATI
I (2329) SIM_4G: Received: ATI
Quectel
EG800K
Revision: EG800KCNGCR07A04M04

OK

I (2829) SIM_4G: Sent command: AT+CGSN
I (3329) SIM_4G: Received: AT+CGSN
862635064814932

OK

I (3829) SIM_4G: Sent command: AT+CPIN?
I (4329) SIM_4G: Received: AT+CPIN?
+CPIN: READY

OK

I (4829) SIM_4G: Sent command: AT+CSQ
I (5329) SIM_4G: Received: AT+CSQ
+CSQ: 31,99

OK

I (5829) SIM_4G: Sent command: AT+CREG?
I (6329) SIM_4G: Received: AT+CREG?
+CREG: 0,1

OK


--- Cau hinh APN va ket noi du lieu ---
I (11329) SIM_4G: Sent command: AT+CGDCONT=1,"IP","v-internet"
I (11839) SIM_4G: Received: AT+CGDCONT=1,"IP","v-internet"
OK

I (12339) SIM_4G: Sent command: AT+QIACT=1
I (12839) SIM_4G: Received: AT+QIACT=1
ERROR

I (27839) SIM_4G: Sent command: AT+QIACT?
I (28339) SIM_4G: Received: AT+QIACT?
+QIACT: 1,1,1,"9.204.251.200"

OK


--- Bat GPS va lay toa do (dat module ngoai troi) ---
I (28339) SIM_4G: Sent command: AT+QGPS=1
I (28839) SIM_4G: Received: AT+QGPS=1
+CME ERROR: 504

Dang cho GPS fix lan dau, viec nay co the mat vai phut...
I (33839) SIM_4G: Sent command: AT+QGPSLOC=2
I (34349) SIM_4G: Received: AT+QGPSLOC=2
+QGPSLOC: 005351.00,10.88862,106.77975,0.00,0.0,0,,0.192,0.105,180925,00

OK

I (214349) SIM_4G: Sent command: AT+QGPSLOC=2
I (214859) SIM_4G: Received: AT+QGPSLOC=2
+QGPSLOC: 005652.00,10.88855,106.77972,0.00,0.0,0,,0.812,0.445,180925,00

OK

I (219859) SIM_4G: Sent command: AT+QGPSTIME
I (220359) SIM_4G: Received: AT+QGPSTIME
ERROR


--- Tat GPS de tiet kiem nang luong ---
I (220859) SIM_4G: Sent command: AT+QGPSEND
I (221359) SIM_4G: Received: AT+QGPSEND
OK


--- Tat ket noi du lieu ---
I (221859) SIM_4G: Sent command: AT+QIDEACT=1
I (222359) SIM_4G: Received: AT+QIDEACT=1
OK


--- Chuong trinh kiem tra hoan tat ---
I (222859) main_task: Returned from app_main()

