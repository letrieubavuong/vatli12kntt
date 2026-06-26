export default {
  "theory": "## NHIỆT DUNG RIÊNG\n\n> **Lưu ý:** \n\n> -  **Nhiệt dung riêng** của một chất là nhiệt lượng cần truyền cho 1 kg chất đó để làm cho nhiệt độ của nó tăng thêm 1 độ ($1^\\circ C$ hoặc 1 K).\n> -  Kí hiệu: c\n> -  Đơn vị: $J/kg.K$\n> \n\n> **Lưu ý:** Nhiệt dung riêng của nhôm là 880 J/kg.K nghĩa là nhiệt lượng cần truyền cho 1 kg nhôm để làm nhiệt độ của nó tăng thêm 1 K là 880 J.\n\n__BANG_START__Nhiệt dung riêng của một số chất\n| \\text { Chất  | \\text { Nhiệt dung riêng } ($J/kg.K$) |\n| --- | --- |\n| Nhôm | 880 |\n| Thủy ngân | 140 |\n| Đồng | 380 |\n| Chì | 126 |\n| Nước biển | 3950 |\n| Nước | 4180 |\n| Rượu | 2500 |\n__BANG_END__\n\n## HỆ THỨC TÍNH NHIỆT LƯỢNG TRONG QUÁ TRÌNH TRUYỀN NHIỆT ĐỂ LÀM THAY ĐỔI NHIỆT ĐỘ CỦA VẬT\n\n> **Lưu ý:** Độ lớn của nhiệt lượng cần cung cấp cho vật để làm tăng nhiệt độ của nó phụ thuộc vào: khối lượng của vật; độ tăng nhiệt độ và tính chất của chất làm vật\n\n$$\n\\begin{aligned}\n\\boxed{Q=mc\\Delta t=mc(t_2-t_1)}\n\\quad \\begin{cases}\n\\ct{c: nhiệt dung riêng (J/kg.K) của chất}\\\\\n\\ct{m: khối lượng của vật (kg)}\\\\\nt_1\\ct{: nhiệt độ ban đầu của vật}\\\\\nt_2\\ct{: nhiệt độ lúc sau của vật}\n\\end{cases}\n\\end{aligned}\n$$\n\n> **Lưu ý:** $Q>0$: Vật thu nhiệt\\\\\n> $Q<0$: Vật tỏa nhiệt\n\n## ĐIỀU KIỆN CÂN BẰNG NHIỆT \n\n> **Lưu ý:** Khi hệ cô lập về nhiệt ở trạng thái cân bằng nhiệt, tổng nhiệt lượng trao đổi của các vật trong hệ bằng không.\n\n$$\n\\begin{aligned}\n\\boxed{Q_1+Q_2+...+Q_n=0}\n\\quad \n\\begin{cases}\nQ_1=m_1.c_1.(t-t_1);\\ Q_2=m_2.c_2.(t-t_2),...\\\\\nt_1,\\ t_2,... \\ct{là nhiệt độ ban đầu của các vật}\\\\\nt\\ \\ct{là nhiệt độ của các vật ở trạng thái cân bằng nhiệt}\n\\end{cases}\n\\end{aligned}\n$$\n\n## ỨNG DỤNG NHIỆT DUNG RIÊNG\nNhiệt dung riêng là thông tin quan trọng được dùng khi lựa chọn vật liệu cho các hệ thống làm mát, sưởi ấm,…\n\n![Hình ảnh](/images/suoisan.png)\n\n*Hệ thống sưởi ấm sàn*",
  "exercises": [
    {
      "id": "b5-ex-1",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Nhiệt dung riêng của đồng là $380 \\ J/kg. K$, điều này cho biết",
      "options": [
        "nhiệt lượng cần thiết để làm cho $1 \\ g$ đồng nóng lên thêm $1^\\circ C$ là $380 \\ J$",
        "nhiệt lượng cần thiết để làm cho 1 khối đồng nóng lên thêm $1^\\circ C$ là $380 \\ J$",
        "nhiệt lượng cần thiết để làm cho $1 \\ kg$ đồng nóng lên thêm $1^\\circ C$ là $380 \\ J$",
        "nhiệt lượng cần thiết để làm cho $1 \\ kg$ đồng nóng lên là $380 \\ J$"
      ],
      "correctOption": 2,
      "explanation": "Nhiệt dung riêng của đồng là $380 \\ J/kg. K$ có nghĩa là để tăng nhiệt độ của 1 kg đồng lên thêm $1^\\circ C$, cần cung cấp $380$ J nhiệt lượng."
    },
    {
      "id": "b5-ex-2",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Đơn vị của nhiệt dung riêng là",
      "options": [
        "$J / kg . K$",
        "$J /kg / K$",
        "$K / kg. J$",
        "$kg / J . K$"
      ],
      "correctOption": 0,
      "explanation": "Đơn vị của nhiệt dung riêng là $\\dfrac{J}{kg . K}$."
    },
    {
      "id": "b5-ex-3",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "__IMMINI__Cho nhiệt dung riêng của một số chất ở $0^\\circ C$ ở bảng bên. Nếu các chất trên có cùng khối lượng thì chất nào sẽ dễ nóng lên và cũng dễ nguội đi so với các chất còn lại?",
      "options": [
        "Nhôm",
        "Đồng",
        "Chì",
        "Nước đá"
      ],
      "correctOption": 2,
      "explanation": "Chì có nhiệt dung riêng thấp nhất, do đó nó sẽ dễ nóng lên và cũng dễ nguội đi hơn các chất còn lại khi có cùng khối lượng."
    },
    {
      "id": "b5-ex-4",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Nhiệt lượng cần cung cấp để tăng nhiệt độ của $m \\ kg$ vật liệu (có nhiệt dung riêng $c$) từ nhiệt độ $t_1$ lên tới nhiệt độ $t_2$ là",
      "options": [
        "$Q=m c\\left(t_2-t_1\\right)$",
        "$Q=m c\\left(t_2+t_1\\right)$",
        "$Q=m c\\left(t_2 . t_1\\right)$",
        "$Q=m c\\left(\\dfrac{t_2}{t_1}\\right)$"
      ],
      "correctOption": 0,
      "explanation": "Nhiệt lượng $Q$ cần cung cấp để tăng nhiệt độ của một khối lượng $m$ vật liệu từ nhiệt độ $t_1$ lên tới nhiệt độ $t_2$ được tính theo công thức:\n $$Q = mc\\Delta t = m c (t_2 - t_1)$$ \n trong đó $c$ là nhiệt dung riêng của vật liệu, $t_2$ là nhiệt độ sau cùng và $t_1$ là nhiệt độ ban đầu."
    },
    {
      "id": "b5-ex-5",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Trong công thức tính nhiệt lượng thu vào: $Q=mc\\Delta t=m c\\left(t_2-t_1\\right)$, $t_2$ là",
      "options": [
        "nhiệt độ lúc đầu của vật",
        "nhiệt độ lúc sau của vật",
        "thời điểm vật bắt đầu nhận nhiệt lượng",
        "thời điểm sau khi vật nhận nhiệt lượng"
      ],
      "correctOption": 1,
      "explanation": "- Trong công thức $Q=mc\\Delta t=m c\\left(t_2-t_1\\right)$, $t_2$ là nhiệt độ lúc sau của vật, và $t_1$ là nhiệt độ lúc đầu của vật. \n - Sự chênh lệch nhiệt độ $\\Delta t = t_2 - t_1$ biểu thị sự thay đổi nhiệt độ của vật khi trao đổi nhiệt."
    },
    {
      "id": "b5-ex-6",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Độ lớn của nhiệt lượng cần cung cấp cho vật để làm tăng nhiệt độ của vật không phụ thuộc vào",
      "options": [
        "khối lượng của vật",
        "độ tăng nhiệt độ của vật",
        "tính chất của chất làm vật",
        "khối lượng riêng của vật"
      ],
      "correctOption": 3,
      "explanation": "Khối lượng riêng của vật không ảnh hưởng đến nhiệt lượng cần để tăng nhiệt độ của vật. Nhiệt lượng chỉ phụ thuộc vào khối lượng, độ tăng nhiệt độ và tính chất của chất làm vật."
    },
    {
      "id": "b5-ex-7",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Nhiệt dung riêng của đồng lớn hơn chì. Vì vậy để tăng nhiệt độ của $3 \\ kg$ đồng và $3 \\ kg$ chì thêm $15^\\circ C$ thì",
      "options": [
        "khối chì cần nhiều nhiệt lượng hơn khối đồng",
        "khối đồng cần nhiều nhiệt lượng hơn khối chì",
        "hai khối đều cần nhiệt lượng như nhau",
        "không khẳng định được"
      ],
      "correctOption": 1,
      "explanation": "Vì nhiệt dung riêng của đồng lớn hơn chì, nên để tăng nhiệt độ của cùng một khối lượng đồng và chì thêm $15^\\circ C$, khối đồng sẽ cần nhiều nhiệt lượng hơn. Sử dụng công thức:\n $$Q = mc\\Delta t$$\n khi $m$ và $\\Delta t$ là như nhau, nhiệt lượng $Q$ sẽ phụ thuộc vào $c$ (nhiệt dung riêng)."
    },
    {
      "id": "b5-ex-8",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Có bốn bình $A,\\ B,\\ C,\\ D$ đều đựng nước ở cùng một nhiệt độ với thể tích tương ứng là 1 lít, 2 lít, 3 lít, 4 lít. Sau khi dùng các đèn cồn giống hệt nhau để đun các bình này trong cùng một khoảng thời gian. Bình có nhiệt độ thấp nhất là bình",
      "options": [
        "A",
        "B",
        "C",
        "D"
      ],
      "correctOption": 3,
      "explanation": "Do các bình được đun bằng các đèn cồn giống hệt nhau trong cùng một khoảng thời gian, bình có thể tích lớn nhất sẽ có nhiệt độ tăng lên ít nhất vì nhiệt lượng cung cấp được chia sẻ cho khối lượng nước lớn hơn. Vì vậy, bình $D$ (có thể tích lớn nhất 4 lít) sẽ có nhiệt độ thấp nhất."
    },
    {
      "id": "b5-ex-9",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Cung cấp nhiệt lượng $Q_1$ cho băng, làm tăng nhiệt độ của khối băng từ $-10^\\circ C$ lên $-5^\\circ C$. Tuy nhiên ta phải cung cấp nhiệt lượng $Q_2>Q_1$ vào cùng một khối lượng nước ở dạng lỏng để làm tăng nhiệt độ của nó từ $15^\\circ C$ lên $20^\\circ C$. Từ những kết quả này, bạn có thể kết luận gì?",
      "options": [
        "Nhiệt dung riêng của băng lớn hơn của nước",
        "Cần thêm thông tin để rút ra kết luận",
        "Nhiệt dung riêng của băng nhỏ hơn của nước",
        "Nhiệt dung riêng của băng và nước như nhau"
      ],
      "correctOption": 2,
      "explanation": "Vì lượng năng lượng cần thiết để tăng $5^\\circ C$ cho băng ít hơn so với lượng năng lượng cần để tăng $5^\\circ C$ cho một khối lượng nước bằng nhau, chúng ta kết luận rằng nhiệt dung riêng của băng $c=\\dfrac{Q}{m . \\Delta T}$ nhỏ hơn của nước"
    },
    {
      "id": "b5-ex-10",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Calo là nhiệt lượng cần thiết để làm cho một gam nước nóng thêm $1^\\circ C$. Nhiệt dung riêng của nước là $c= 4200\\ J/kg.K$. Phát biểu nào sau đây đúng?",
      "options": [
        "1 calo $\\approx 4200 \\ J$",
        "1 calo $\\approx 4,2 \\ J$",
        "1 calo $\\approx 42 \\ J$",
        "1 calo $\\approx 42 \\ kJ$"
      ],
      "correctOption": 1,
      "explanation": "Nhiệt dung riêng của nước là $4200 \\ J/kg.K$, nghĩa là cần $4200 \\ J$ để làm nóng $1 \\ kg$ nước thêm $1^\\circ C$. Để làm nóng $1 \\ g$ nước thêm $1^\\circ C$, cần $4,2 \\ J$. Vì vậy, 1 calo (là lượng nhiệt cần thiết để làm nóng $1 \\ g$ nước thêm $1^\\circ C$) xấp xỉ $4,2 \\ J$."
    },
    {
      "id": "b5-ex-11",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Trong thí nghiệm đo nhiệt dung riêng của nước thì thiết bị nào sau đây không được sử dụng?",
      "options": [
        "Nhiệt lượng kế",
        "Nhiệt kế",
        "Cân điện tử",
        "Biến trở"
      ],
      "correctOption": 3,
      "explanation": "Nhiệt lượng kế được dùng để đo nhiệt lượng, nhiệt kế để đo nhiệt độ, và cân điện tử để đo khối lượng. Biến trở không được sử dụng trong việc đo nhiệt dung riêng của nước."
    },
    {
      "id": "b5-ex-12",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Trong thí nghiệm đo nhiệt dung riêng của nước, nhiệt dung riêng của nước được xác định bằng công thức nào sau đây?",
      "options": [
        "$c=\\dfrac{{\\overline{P}}}{m . \\Delta T}$",
        "$c=\\dfrac{m . \\Delta T}{{\\overline{P}} . \\Delta \\tau}$",
        "$c=\\dfrac{{\\overline{P}} . \\Delta T}{m . \\Delta \\tau}$",
        "$c=\\dfrac{{\\overline{P}} . \\Delta \\tau}{m . \\Delta T}$"
      ],
      "correctOption": 3,
      "explanation": "Trong thí nghiệm đo nhiệt dung riêng của nước, nhiệt dung riêng $c$ của nước được xác định bằng công thức:\n $$c=\\dfrac{{\\overline{P}} . \\Delta \\tau}{m . \\Delta T}$$\n trong đó ${\\overline{P}}$ là công suất trung bình (J/s), $\\Delta \\tau$ là thời gian (s), $m$ là khối lượng nước (kg) và $\\Delta T$ là độ tăng nhiệt độ ($^\\circ C$ hoặc K)."
    },
    {
      "id": "b5-ex-13",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Hình bên dưới là các dụng cụ để đo nhiệt dung riêng của nước:\n \\begin{center}\n \\begin{tikzpicture}[scale=.8,thick,>=stealth']\n \\node[rotate=0] (russell) at (-1,0.5) {\\includegraphics[width=2.2cm]{Images/candientu}};\n \\node[rotate=0] (russell) at (1.5,0.5) {\\includegraphics[width=2.8cm]{Images/bienthenguon}};\n \\node[rotate=0] (russell) at (4,0.5) {\\includegraphics[width=1.5cm]{Images/oatke}};\n \\node[rotate=0] (russell) at (6.5,1) {\\includegraphics[width=2.6cm]{Images/nlkvank}};\n \n \\node at (-1,2.5) {(5)};\n \\node at (0.8,2.45) {(1)};\n \\node at (4.5,-1) {(2)};\n \\node at (7.5,-1.5) {(4)};\n \\draw (-1,2) -- (-1,1);\n \\draw (1,2) -- (1.5,1);\n \\draw (4.35,-0.75) -- (4,-0.3);\n \\draw (6.45,-0.65) -- (7.2,-1.25);\n \\draw (6.5,2) -- (5.5,2.5);\n \\node at (5.15,2.7) {(3)};\n \\end{tikzpicture}\n \\end{center}\n Hãy cho biết dụng cụ số (3) là",
      "options": [
        "Biến thế nguồn",
        "Cân điện tử",
        "Nhiệt lượng kế",
        "Nhiệt kế điện tử"
      ],
      "correctOption": 3,
      "explanation": "Dụng cụ số (3) trong hình là nhiệt kế điện tử, dùng để đo nhiệt độ của nước."
    },
    {
      "id": "b5-ex-14",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "__IMMINI__Học sinh thả các thanh được nung nóng có khối lượng bằng nhau, được làm từ thép, đồng và nhôm vào ba nhiệt lượng kế có chứa cùng thể tích nước lạnh. Nhiệt độ ban đầu của tất cả các thanh là như nhau và lớn hơn nhiệt độ của nước. Nhiệt độ ban đầu của nước trong tất cả các nhiệt lượng kế là như nhau. Khi cân bằng nhiệt thì nhiệt độ được ghi như hình bên. Chất có nhiệt dung riêng lớn nhất là",
      "options": [
        "nhôm",
        "đồng",
        "thép",
        "chưa đủ căn cứ để kết luận"
      ],
      "correctOption": 0,
      "explanation": "nhôm"
    },
    {
      "id": "b5-ex-15",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Vào ban ngày và ban đêm thì hướng gió thổi thay đổi như thế nào ở các vùng ven biển?",
      "options": [
        "Ban ngày gió thổi từ Bắc tới Nam còn ban đêm gió thổi từ Nam tới Bắc",
        "Ban ngày gió thổi từ biển vào đất liền còn ban đêm gió thổi từ đất liền ra biển",
        "Ban ngày gió thổi từ Nam tới Bắc còn ban đêm gió thổi từ Bắc tới Nam",
        "Ban ngày gió thổi từ đất liền ra biển còn ban đêm gió thổi từ biển vào đất liền"
      ],
      "correctOption": 1,
      "explanation": "Ban ngày, đất có nhiệt dung riêng thấp nên nóng lên nhanh hơn nước biển, khiến không khí trên đất liền nóng hơn. Do đó, gió thổi từ biển vào đất liền để thay thế lượng không khí tăng lên đó. Còn ban đêm, đất liền mất nhiệt nhanh chóng hơn biển, làm không khí trên đất liền lạnh đi và co lại, tăng mật độ và áp suất. Do đó, gió thổi từ đất liền ra biển để thay thế lượng không khí mất đi đó."
    },
    {
      "id": "b5-ex-16",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Nếu ăn bánh ngọt ngay khi vừa đem ra khỏi lò nướng, phần vỏ bánh có thể không gây tổn hại gì đến bạn nhưng phần nhân sẽ làm bỏng lưỡi của bạn. Điều này được giải thích như thế nào?",
      "options": [
        "Phần nhân bánh, đặc biệt nếu có chứa nước hoặc các thành phần lỏng (như kem, mứt, hoặc nhân trái cây), có nhiệt dung riêng cao hơn",
        "Sau khi ra khỏi lò, vỏ bánh tiếp xúc trực tiếp với không khí bên ngoài nên nó nguội đi nhanh chóng",
        "Phần vỏ bánh được nướng ở nhiệt độ thấp hơn so với phần nhân",
        "Phần nhân bánh chứa ít nước hơn phần vỏ bánh nên nhiệt độ cao hơn"
      ],
      "correctOption": 1,
      "explanation": "- ĐÚNG ĐÚNG SAI SAI\n - Nhiệt dung riêng: Nhiệt dung riêng của nước cao hơn so với các chất rắn trong vỏ bánh, giúp phần nhân giữ nhiệt lâu hơn.\n - Khả năng cách nhiệt của vỏ bánh: Vỏ bánh hoạt động như một lớp cách nhiệt, giữ nhiệt bên trong phần nhân.\n - Tốc độ tản nhiệt: Vỏ bánh tản nhiệt nhanh hơn do tiếp xúc với không khí, trong khi phần nhân tản nhiệt chậm hơn do nằm bên trong.\n \n - Ví dụ, nhiệt dung riêng của nước là khoảng $4186 \\ J/kg.K$, trong khi nhiệt dung riêng của các chất rắn như bột mì là khoảng $1300 \\ J/kg.K$. Điều này cho thấy phần nhân chứa nước có thể giữ lại nhiều nhiệt hơn.\n - Do đó, khi bạn ăn bánh ngay khi vừa ra khỏi lò, vỏ bánh đã nguội đi đủ để không gây bỏng, nhưng phần nhân bên trong vẫn còn rất nóng và có thể làm bỏng lưỡi của bạn. Để tránh bị bỏng, bạn nên để bánh nguội trong vài phút sau khi lấy ra khỏi lò, giúp nhiệt độ của cả vỏ và nhân giảm xuống mức an toàn để thưởng thức."
    },
    {
      "id": "b5-ex-17",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Để xác định nhiệt dung riêng của nước, có thể tiến hành thí nghiệm theo sơ đồ nguyên lí như hình bên",
      "options": [
        "Biến áp nguồn có nhiệm vụ cung cấp cho mạch một hiệu điện thế",
        "Oát kế dùng để đo cường độ dòng điện của nguồn điện",
        "Nhiệt lượng tỏa ra trên dây điện trở bằng nhiệt lượng mà nước thu vào",
        "Nhiệt lượng kế ngăn cản sự truyền nhiệt của các chất đặt trong bình với môi trường bên ngoài"
      ],
      "correctOption": 3,
      "explanation": "- [a)] Đúng\n - [b)] Sai\n - [c)] Đúng\n - [d)] Đúng"
    },
    {
      "id": "b5-ex-18",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Những dụng cụ sau có trong thí nghiệm đo nhiệt dung riêng của nước. Các dụng cụ này có tên gọi là gì?\n \\begin{center}\n \\begin{tikzpicture}[scale=1.5,thick,>=stealth']\n \\node[rotate=0] (russell) at (-0.5,0.5) {\\includegraphics[width=2.2cm]{Images/daynoi1}};\n \\node[rotate=0] (russell) at (1.5,0.5) {\\includegraphics[width=3cm]{Images/nhietluongke1}};\n \\node[rotate=0] (russell) at (3.5,0.5) {\\includegraphics[width=2.5cm]{Images/candientu1}};\n \\node[rotate=0] (russell) at (6.5,0.5) {\\includegraphics[width=3cm]{Images/bienthenguon}};\n \n \\node at (-0.5,-1) {(1)};\n \\node at (1.5,-1) {(2)};\n \\node at (3.5,-1) {(3)};\n \\node at (6.5,-1) {(4)};\n \\end{tikzpicture}\n \\end{center}",
      "options": [
        "Bộ phận số (1) là các dây nối",
        "Bộ phận số (2) là biến thế nguồn",
        "Bộ phận số (3) là cân điện tử",
        "Bộ phận số (4) là bình nhiệt lượng kế (có dây nung và que khuấy)"
      ],
      "correctOption": 2,
      "explanation": ""
    },
    {
      "id": "b5-ex-19",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Trên hình vẽ là đồ thị thu được từ thực nghiệm thể hiện sự phụ thuộc của nhiệt độ vào thời gian khi đun nóng một chất nào đó. Ban đầu chất ở trạng thái lỏng.\n \\begin{center}\n \\begin{tikzpicture}[scale=1.2,thick,>=stealth']\n \\tkzDefPoints{0/0/o, 5/0/x, 0/4/y, 0.5/0/a, 2/2/b, 3.5/2/c, 4.5/3.5/d}\n \\draw [help lines, xstep=0.5cm,ystep=0.5cm] (0,0) grid (5,4);\n \\tkzDrawSegments[->](o,x o,y)\n \\tkzLabelPoint[below](o){$0$}\n \\tkzLabelPoint[below right](x){$t$ (phút)}\n \\tkzLabelPoint[above](y){$t\\ (^\\circ C)$}\n \n \\foreach \\x in {1,2,...,4}\n {\\pgfmathtruncatemacro{\\label}{2*\\x};\n \\node[below]\n (\\label) at (\\x,0) {\\label};\n \\draw[fill=white](\\x,0)circle(0.5pt);}\n \n \\begin{scope}[shift={(0,-2)},rotate=0]\n \\foreach \\y in {2,3,...,5}\n {\\pgfmathtruncatemacro{\\label}{20*\\y};\n \\node[left]\n (\\label) at (0,\\y) {\\label};\n \\draw[fill=white](0,\\y)circle(0.5pt);}\n \\end{scope}\n \n \\tkzDrawSegments[very thick,red](a,b b,c c,d)\n \\tkzDrawPoints[size=3,fill=white](a,b,c,d)\n \\tkzLabelPoint[above left](a){$A$}\n \\tkzLabelPoint[above](b){$B$}\n \\tkzLabelPoint[above](c){$C$}\n \\tkzLabelPoint[above](d){$D$}\n \n \\end{tikzpicture}\n \\end{center}",
      "options": [
        "Nhiệt độ sôi của chất lỏng là $80^\\circ C$",
        "Nhiệt dung riêng của chất ở trạng thái lỏng và khí là như nhau",
        "Chất có nhiệt năng lớn nhất tại điểm C",
        "Chất có nhiệt năng nhỏ nhất tại điểm A"
      ],
      "correctOption": 3,
      "explanation": ""
    },
    {
      "id": "b5-ex-20",
      "type": "Dạng 1: Lý thuyết nhiệt dung riêng",
      "question": "Trên đồ thị thể hiện kết quả đo nhiệt lượng $Q$, cần thiết để làm nóng $1 \\ kg$ chất 1 và $1 \\ kg$ chất 2, ở các giá trị nhiệt độ khác nhau của các chất này.\n \\begin{center}\n \\begin{tikzpicture}[scale=1.5,draw=Mapcolor, very thick, >=stealth']\n \\tkzDefPoints{0/0/o, 3/0/x, 0/3/y}\n \\draw [help lines, xstep=0.5cm,ystep=0.5cm] (0,0) grid (3,3);\n \\tkzDrawSegments[Mapcolor, very thick, ->](o,x o,y)\n \\tkzLabelPoint[below](o){$0$}\n \\tkzLabelPoint[below right](x){$t\\ (^\\circ C)$}\n \\tkzLabelPoint[above](y){$Q\\ (x10^3\\ J)$}\n \\draw[red,very thick] (0.5,0) -- (2.75,1.7);\n \\draw[red,very thick] (0.4,0.13) -- (2.2,2.8);\n \\foreach \\x in {1,2,...,4}\n {\\pgfmathtruncatemacro{\\label}{20*\\x};\n \\node[below]\n (\\label) at (.5*\\x,0) {\\label};\n \\draw[fill=white](.5*\\x,0)circle(0.5pt);}\n \n \\foreach \\y in {1,2,...,5}\n {\\pgfmathtruncatemacro{\\label}{10*\\y};\n \\node[left]\n (\\label) at (0,.5*\\y) {\\label};\n \\draw[fill=white](0,.5*\\y)circle(0.5pt);}\n \\node at (2.52,2.94) {1};\n \\node at (2.98,2) {2};\n \\end{tikzpicture}\n \\end{center}",
      "options": [
        "Nhiệt dung của hai chất là như nhau",
        "Nhiệt dung của chất thứ nhất lớn hơn nhiệt dung của chất thứ hai",
        "Để thay đổi nhiệt độ của $1 \\ kg$ chất 1 thêm $20^\\circ C$ cần lượng nhiệt $6000 \\ J$",
        "Để thay đổi nhiệt độ của $1 \\ kg$ chất 2 thêm $10^\\circ C$ cần lượng nhiệt $3750 \\ J$"
      ],
      "correctOption": 3,
      "explanation": ""
    },
    {
      "id": "b5-ex-21",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Biết nhiệt dung riêng của nhôm là $880 \\ J / kg . K$. Nhiệt lượng cần thiết để tăng nhiệt độ của một miếng nhôm có khối lượng $810 \\ g$ từ $20^\\circ C$ đến $75^\\circ C$ là",
      "options": [
        "39804 J",
        "39204 J",
        "36204 J",
        "38704 J"
      ],
      "correctOption": 1,
      "explanation": "Nhiệt lượng cần thiết: $Q=mc\\Delta t=39204 \\ J$."
    },
    {
      "id": "b5-ex-22",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Biết nhiệt độ ban đầu của nước là $20^\\circ C$ và nhiệt dung riêng của nước là $4200 \\ J / kg . K$. Để đun sôi 15 kg nước ở áp suất 1 atm cần cung cấp một nhiệt lượng là",
      "options": [
        "$5040 \\ k J$",
        "$5040 \\ J$",
        "$50,40 \\ k J$",
        "$5,040 \\ J$"
      ],
      "correctOption": 0,
      "explanation": "- Khối lượng của nước: $m = 15 \\ kg$ (vì 1 lít nước tương đương 1 kg)\n - Nước cần tăng nhiệt độ từ $20^\\circ C$ lên $100^\\circ C$, chênh lệch nhiệt độ $\\Delta t = 80^\\circ C$\n - Nhiệt lượng cần thiết:\n $$Q = mc\\Delta t = 15 . 4200 . 80 = 5040000 \\ J = 5040 \\ kJ$$"
    },
    {
      "id": "b5-ex-23",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "$100\\ g$ chì khi được truyền nhiệt lượng $260\\ J$ thì tăng nhiệt độ từ $15^\\circ C$ đến $35^\\circ C$. Nhiệt dung riêng của chì là",
      "options": [
        "$130\\ J/kg . K$",
        "$26\\ J/kg . K$",
        "$130\\ kJ/kg . K$",
        "$260\\ kJ/kg . K$"
      ],
      "correctOption": 0,
      "explanation": "$Q=mc \\Delta t \\Rightarrow c=\\dfrac{Q}{m \\Delta t}=\\dfrac{260}{0,1 .(35-15)}=130\\ J/kg.K \\Rightarrow$ Chọn A"
    },
    {
      "id": "b5-ex-24",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Người ta thực hiện thí nghiệm xác định nhiệt dung riêng của đồng với một miếng đồng có khối lượng 850 g. Lúc đầu nhiệt độ của miếng đồng là $12^\\circ C$. Thời gian từ khi bật bộ phận đốt nóng có công suất 40 W đến khi nhiệt độ của miếng đồng tăng tới $30^\\circ C$ là 146 giây. Giả sử toàn bộ nhiệt lượng được dùng để làm tăng nhiệt độ của miếng đồng. Nhiệt dung riêng của đồng được xác định có giá trị là",
      "options": [
        "$381,7\\ J/kg.K$",
        "$391,7\\ J/kg.K$",
        "$401,7\\ J/kg.K$",
        "$281,7\\ J/kg.K$"
      ],
      "correctOption": 0,
      "explanation": "- Nhiệt dung riêng của đồng: $c=\\dfrac{Q}{m\\Delta t}=\\dfrac{Pt}{m\\Delta t}=\\dfrac{40.146}{0,85.(30-12)}=381,7\\ J/kg.K$."
    },
    {
      "id": "b5-ex-25",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Một ấm nhôm có khối lượng $300 \\ g$ chứa 0,5 lít nước đang ở nhiệt độ $25^\\circ C$. Biết khối lượng riêng của nước là $1000\\ kg/m^3$; nhiệt dung riêng của nhôm, nước lần lượt là $c_1=880 \\ J / kg . K,\\ c_2=4200 \\ J / kg . K$. Nhiệt lượng cần cung cấp để đun sôi nước trong ấm ở áp suất 1 atm là",
      "options": [
        "$177,3 \\ kJ$",
        "$177,3 \\ J$",
        "$177300 \\ kJ$",
        "$17,73 \\ J$"
      ],
      "correctOption": 0,
      "explanation": "- Khối lượng của ấm nhôm: $m_1 = 300 \\ g = 0,3 \\ kg$\n - Khối lượng của nước: $m_2 = 0,5 \\ lít = 0,5 \\ kg$\n - Để đun sôi, nước cần tăng nhiệt độ từ $25^\\circ C$ lên $100^\\circ C$, chênh lệch nhiệt độ $\\Delta t = 75^\\circ C$\n - Nhiệt lượng cần thiết để đun nóng ấm nhôm:\n $$Q_1 = m_1 c_1 \\Delta t = 0,3 . 880 . 75 = 19800 \\ J = 19,8 \\ kJ$$\n - Nhiệt lượng cần thiết để đun nóng nước:\n $$Q_2 = m_2 c_2 \\Delta t = 0,5 . 4200 . 75 = 157500 \\ J = 157,5 \\ kJ$$\n - Tổng nhiệt lượng: \n $$Q = Q_1 + Q_2 = 19,8 \\ kJ + 157,5 \\ kJ = 177,3 \\ kJ$$"
    },
    {
      "id": "b5-ex-26",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Một ấm nhôm khối lượng $500\\ g$ đựng 2 lít nước ở $20^\\circ C$. Biết nhiệt dung riêng của nước và nhôm lần lượt là $4200\\ J/kg . K$ và $920\\ J/kg . K$. Biết khối lượng riêng của nước là $1\\ kg/$lít. Nhiệt lượng cần cung cấp để đun sôi nước trong ấm trên ở áp suất tiêu chuẩn là",
      "options": [
        "$708,8\\ kJ$",
        "$36,8\\ kJ$",
        "$672\\ kJ$",
        "$635,2\\ kJ$"
      ],
      "correctOption": 0,
      "explanation": "- Khối lượng của nước $m_1=\\rho_1 . V_1=1 . 2=2\\ kg$\n - $Q=m_1 c_1 \\Delta t+m_2 c_2 \\Delta t=\\left(m_1 c_1+m_2 c_2\\right) \\Delta t=(2 . 4200+0,5 . 920)(100-20)=708800\\ J=708,8\\ kJ.$"
    },
    {
      "id": "b5-ex-27",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "__IMMINI__Một học sinh dùng bình nhiệt lượng kế có dây đun nóng bằng điện để tiến hành thí nghiệm xác định nhiệt dung riêng của nước. Học sinh này cho $150 \\ g$ nước tinh khiết vào nhiệt lượng kế rồi tiến hành đun nóng. Biết hiệu điện thế giữa hai đầu dây nung là $6 \\ V$ và cường độ dòng điện qua nó là $2,5 \\ A$. Sau khi đun được hai phút học sinh tiến hành ghi lại nhiệt độ trên nhiệt kế sau mỗi phút. Với kết quả thu được, học sinh này vẽ được đồ thị sự tăng nhiệt độ theo thời gian như hình bên}{\\begin{tikzpicture}[scale=1,thick,>=stealth']\n \\tkzDefPoints{0/0/o, 5.25/0/x, 0/4/y, 0.5/0/a, 2/2/b, 3.5/2/c, 4.5/3.5/d}\n \\draw [dashed,help lines, xstep=0.5cm,ystep=0.5cm] (0,0) grid (4.5,3.5);\n \\tkzDrawSegments[very thick,Mapcolor, ->](o,x o,y)\n \\tkzLabelPoint[below left](o){$O$}\n \\tkzLabelPoint[above](x){$\\tau$ (phút)}\n \\tkzLabelPoint[above](y){$t\\ (^\\circ C)$}\n \n \\foreach \\x in {1,2,...,9}\n {\\pgfmathtruncatemacro{\\label}{\\x};\n \\node[below]\n (\\label) at (.5*\\x,0) {\\label};\n \\draw[fill=white](.5*\\x,0)circle(0.5pt);}\n \n \n \\foreach \\y in {1,2,3,...,7}\n {\\pgfmathtruncatemacro{\\label}{5*\\y};\n \\node[left]\n (\\label) at (0,.5*\\y) {\\label};\n \\draw[fill=white](0,.5*\\y)circle(0.5pt);}\n \\tkzDefPoints{1/2.25/a, 1.5/2.4/b, 2/2.5/c, 2.5/2.65/d, 3/2.7/e, 3.5/2.85/f, 4/3/h}\n \\draw[very thick,red] (1,2.25) -- (4.25,3.05);\n \\tkzDrawPoints[size=3,fill=white](a,b,c,d,e,f,h)\n\\end{tikzpicture}}\n\nNhiệt dung riêng của nước được xác định từ đồ thị là",
      "options": [
        "$700\\ J/kg.K$",
        "$4100\\ J/kg.K$",
        "$2400\\ J/kg.K$",
        "$4800\\ J/kg.K$"
      ],
      "correctOption": 3,
      "explanation": "Dựa vào đồ thị ta chọn:\n \n Điểm $M$ có giá trị tại $t=4$ phút, nhiệt độ $t_1 \\approx 25^\\circ C$.\n \n Điểm $N$ có giá trị tại $t=8$ phút, nhiệt độ $t_2 \\approx 30^\\circ C$.\n \n Nhiệt lượng do dây nung cung cấp trong thời gian $\\Delta t=4$ phút là: $Q=UIt=6.2,5.4.60=3600\\ J$. \n \n Độ tăng nhiệt độ: $\\Delta t=\\left(T_2-T_1\\right) \\approx 5 \\ K$\n \n Nhiệt dung riêng của nước tính được là: $c=\\dfrac{Q}{m . \\Delta t}=4800 \\ J / kg . K$."
    },
    {
      "id": "b5-ex-28",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "__IMMINI__Một học sinh dùng bình nhiệt lượng kế có dây đun nóng bằng điện để tiến hành thí nghiệm xác định nhiệt dung riêng của nước. Học sinh này cho $150 \\ g$ nước tinh khiết vào nhiệt lượng kế rồi tiến hành đun nóng. Biết hiệu điện thế giữa hai đầu dây nung là $6 \\ V$ và cường độ dòng điện qua nó là $2,5 \\ A$. Sau khi đun được hai phút học sinh tiến hành ghi lại nhiệt độ trên nhiệt kế sau mỗi phút. Với kết quả thu được, học sinh này vẽ được đồ thị sự tăng nhiệt độ theo thời gian như hình bên}{\\begin{tikzpicture}[scale=1,thick,>=stealth']\n \\tkzDefPoints{0/0/o, 5.25/0/x, 0/4/y, 0.5/0/a, 2/2/b, 3.5/2/c, 4.5/3.5/d}\n \\draw [dashed,help lines, xstep=0.5cm,ystep=0.5cm] (0,0) grid (4.5,3.5);\n \\tkzDrawSegments[very thick,Mapcolor, ->](o,x o,y)\n \\tkzLabelPoint[below left](o){$O$}\n \\tkzLabelPoint[above](x){$\\tau$ (phút)}\n \\tkzLabelPoint[above](y){$t\\ (^\\circ C)$}\n \n \\foreach \\x in {1,2,...,9}\n {\\pgfmathtruncatemacro{\\label}{\\x};\n \\node[below]\n (\\label) at (.5*\\x,0) {\\label};\n \\draw[fill=white](.5*\\x,0)circle(0.5pt);}\n \n \n \\foreach \\y in {1,2,3,...,7}\n {\\pgfmathtruncatemacro{\\label}{5*\\y};\n \\node[left]\n (\\label) at (0,.5*\\y) {\\label};\n \\draw[fill=white](0,.5*\\y)circle(0.5pt);}\n \\tkzDefPoints{1/2.25/a, 1.5/2.4/b, 2/2.5/c, 2.5/2.65/d, 3/2.7/e, 3.5/2.85/f, 4/3/h}\n \\draw[very thick,red] (1,2.25) -- (4.25,3.05);\n \\tkzDrawPoints[size=3,fill=white](a,b,c,d,e,f,h)\n\\end{tikzpicture}}\n\nSự sai lệch của số liệu tính toán được so với nhiệt dung riêng thực tế của nước là do",
      "options": [
        "Một phần nhiệt lượng bị thất thoát ra môi trường xung quanh do hiện tượng truyền nhiệt",
        "Nhiệt lượng kế hấp thụ $>90\\%$ nhiệt lượng nên không phải toàn bộ nhiệt năng từ điện trở truyền vào nước",
        "Dòng điện qua điện trở không ảnh hưởng đến nhiệt lượng cung cấp cho nước",
        "Nhiệt độ của nước không thay đổi theo thời gian nên không thể tính được nhiệt dung riêng"
      ],
      "correctOption": 0,
      "explanation": ""
    },
    {
      "id": "b5-ex-29",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Một ấm nhôm khối lượng $400 \\ g$ chứa $1 \\ kg$ nước, biết nhiệt độ ban đầu của ấm và nước là $20^\\circ C$, nhiệt dung riêng của nhôm và nước lần lượt là $880\\ J/kg. K$ và $4200 \\ J/kg.K$. Nhiệt lượng cần thiết để đun sôi nước ở áp suất 1 atm là",
      "options": [
        "$28160 \\ J$",
        "$336000 \\ J$",
        "$364160 \\ J$",
        "$235710 \\ J$"
      ],
      "correctOption": 2,
      "explanation": "- Nhiệt lượng cần để đun nóng ấm nhôm: $Q_1 = m_1c_1\\Delta t$.\n - Nhiệt lượng cần để đun nóng nước: $Q_2 = m_2c_2\\Delta t$.\n - Tổng nhiệt lượng cần thiết: $Q = Q_1 + Q_2 = 364160 \\ J$."
    },
    {
      "id": "b5-ex-30",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "%[1P6K1-2][Loai10]\n Một ấm đun nước bằng nhôm có $m=350\\ g$, chứa $2,75\\ kg$ nước được đun trên bếp. Khi nhận được nhiệt lượng $650\\ kJ$ thì ấm đạt đến nhiệt độ $60^{\\circ}C$. Biết $c_{Al}=880\\ J/kg.K$, $c_{H_2O}=4190\\ J/kg.K$. Nhiệt độ ban đầu của ấm xấp xỉ là",
      "options": [
        "$6,3^{\\circ}C$",
        "$5,1^{\\circ}C$",
        "$12,1^{\\circ}C$",
        "$8,9^{\\circ}C$"
      ],
      "correctOption": 1,
      "explanation": "- Nhiệt lượng thu vào: \n \n &Q_{H_2O}=m_{H_2O}.c_{H_2O}(t_2-t_1)=691350-11522,5t_1\\\\ \n &Q_{Al}=m_{Al}.c_{Al}(t_2-t_1)=18480-308t_1\n \n - Nhiệt lượng ấm nhôm đựng nước nhận được là $650.10^3$ J: \n \n \\Rightarrow Q_{H_2O}+Q_{Al}=650.10^3\\Rightarrow t_1=5,1^{\\circ}C."
    },
    {
      "id": "b5-ex-31",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Thùng nhôm có khối lượng $1,2 \\ kg$ đựng $4 \\ kg$ nước ở $90^\\circ C$. Cho biết nhiệt dung riêng của nhôm và nước lần lượt là $c_1=0,88 \\ kJ / kg . K$, $c_2=4,186 \\ kJ / kg . K$. Nhiệt lượng toả ra khi nhiệt độ hạ còn $30^\\circ C$ là",
      "options": [
        "1068 kJ",
        "1000 kJ",
        "968 kJ",
        "668 kJ"
      ],
      "correctOption": 0,
      "explanation": "- $Q=1068 \\ kJ$"
    },
    {
      "id": "b5-ex-32",
      "type": "Dạng 2: Tính nhiệt lượng",
      "question": "Một ấm điện bằng nhôm có khối lượng $0,5 \\ kg$ chứa $2 \\ kg$ nước ở nhiệt độ $25^\\circ C$. Biết rằng nhiệt dung riêng của nước là $c=4200 \\ J /kg$.K. Nhiệt dung riêng của nhôm là $c_1=880 \\ J /kg$.K và $30\\%$ nhiệt lượng tỏa ra môi trường xung quanh. Muốn đun sôi lượng nước đó ở áp suất 1 atm trong thời gian $20$ phút thì ấm phải có công suất là",
      "options": [
        "$789,3 \\ W$",
        "$700,3 \\ W$",
        "$770,3 \\ W$",
        "$899,3 \\ W$"
      ],
      "correctOption": 0,
      "explanation": "- Gọi $P$ là công suất tỏa nhiệt của ấm.\n - Nhiệt lượng mà ấm tỏa ra trong thời gian $t=20$ phút $=1200$ giây là:\n \n Q_{\\text {tỏa}}=\\mathcal{P}t=1200\\mathcal{P}\n \n - Nhiệt lượng mà ấm nước thu vào:\n \n Q_{\\text {Thu}}=\\left(m_1 c_1+mc\\right)\\left(t_2-t_1\\right)=(0,5.880+2.4200) 75=663000\\ J\n \n - Vì $30 \\%$ nhiệt lượng tỏa ra môi trường nên ta có phương trình:\n \n & Q_{\\text {tỏa}}.70\\ \\%=Q_{\\text {Thu}}\\\\\n \\Rightarrow \\ & 1200 .\\mathcal{P}.0,7=663000 \\Leftrightarrow \\mathcal{P} \\approx 789,3\\ W"
    },
    {
      "id": "b5-ex-33",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một người thợ rèn nhúng một con dao rựa bằng thép có khối lượng $1,1 \\ kg$ ở nhiệt độ $850^\\circ C$ vào trong bể nước lạnh để làm tăng độ cứng của lưỡi dao. Nước trong bể có thể tích $200$ lít và có nhiệt độ bằng với nhiệt độ ngoài trời là $27^\\circ C$. Bỏ qua sự truyền nhiệt cho thành bể và môi trường bên ngoài. Biết nhiệt dung riêng của thép là $460 \\ J / kg. K$ của nước là $4180 \\ J / kg. K$; khối lượng riêng của nước là $1000\\ kg/m^3$. Nhiệt độ của nước khi có sự cân bằng nhiệt là",
      "options": [
        "$22,4^\\circ C$",
        "$55,6^\\circ C$",
        "$72,4^\\circ C$",
        "$27,5^\\circ C$"
      ],
      "correctOption": 3,
      "explanation": "- Gọi nhiệt độ cân bằng là t\n - Nhiệt lượng do thép truyền cho nước: $Q_{tỏa}=m_1c_1\\Delta t_1=1,1.460.(850-t)$\n - Nhiệt lượng do nước nhận được từ thép: $Q_{thu}=m_2c_2\\Delta t_2=200.4180.(t-27)$\n - Khi có sự cân bằng nhiệt: $Q_{tỏa}=Q_{thu}\\Leftrightarrow t\\approx 27,5^\\circ C$"
    },
    {
      "id": "b5-ex-34",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6-1.2G][Loai3]\n Người ta thả miếng đồng có khối lượng $0,5\\ kg$ vào bình cách nhiệt chứa 500 g nước. Khi cân bằng nhiệt thì miếng đồng nguội đi từ $80^\\circ C$ đến $20^{\\circ}C$. Bỏ qua sự trao đổi nhiệt với môi trường và bình chứa. Lấy $c_{Cu}=380\\ J/kg.K$, $c_{H_2O}=4190\\ J/kg.K$. Nhiệt lượng mà nước nhận được là",
      "options": [
        "$31600\\ J$",
        "$11400\\ J$",
        "$41100\\ J$",
        "$14100\\ J$"
      ],
      "correctOption": 1,
      "explanation": "- Nhiệt lượng trao đổi của miếng đồng: $Q_{Cu}=m_{Cu}.c_{Cu}(t-t_1)=-11400$ J.\n - Theo điều kiện cân bằng nhiệt: $Q_{Cu}+Q_{H_2O}=0\\Rightarrow Q_{H_2O}=11400$ J.\n - Nước nóng lên thêm: \n \n Q_{H_2O}=m_{H_2O}.c_{H_2O}.\\Delta t\\Rightarrow 11400=0,5.4190.\\Delta t\\Rightarrow \\Delta t=5,4^{\\circ}C."
    },
    {
      "id": "b5-ex-35",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một cốc nhôm khối lượng $100 \\ g$ chứa $300 \\ g$ nước ở nhiệt độ $20^\\circ C$. Người ta thả vào cốc nước một thìa đồng khối lượng $75 \\ g$ vừa rút ra khỏi nồi nước sôi ở $100^\\circ C$. Bỏ qua các hao phí nhiệt ra môi trường. Nhiệt dung riêng của nhôm, đồng và nước lần lượt là $880 \\ J / kg. K;\\ 380 \\ J / kg. K;\\ 4190 \\ J / kg. K$. Nhiệt độ của nước trong cốc khi có sự cân bằng nhiệt xấp xỉ là",
      "options": [
        "$21,7\\doC$",
        "$25,0 \\doC$",
        "$28,5 \\doC$",
        "$20,2 \\doC$"
      ],
      "correctOption": 0,
      "explanation": "Phương trình cân bằng nhiệt: \n \n $Q_{cốc} + Q_{nước} = Q_{thìa}$\n \n \n $(m_{cốc}.c_{cốc} + m_n.c_n).(t_{cb} – t_1)= m_{thìa}.c_{thìa}.(t_2 – t_{cb})$\n \n $\\Leftrightarrow [(0,1.880) + (0,3.4,19.103)](t – 20)= 0,075.380.(100 –t)$\n \n Giải ra ta được: $t\\approx 21,7^\\circ C$."
    },
    {
      "id": "b5-ex-36",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Người ta thả một miếng đồng có khối lượng $600\\ g$ ở nhiệt độ $100^\\circ C$ vào $2,5\\ kg$ nước. Nhiệt độ khi có sự cân bằng nhiệt là $30^\\circ C$. Lấy nhiệt dung riêng của đồng là $380\\ J/kg.K$ và của nước là $4200\\ J/kg.K$. Bỏ qua sự trao đổi nhiệt với bình đựng nước và môi trường bên ngoài. Nước nóng lên thêm",
      "options": [
        "$1,52^\\circ C$",
        "$15,2^\\circ C$",
        "$1,82^\\circ C$",
        "$18,2^\\circ C$"
      ],
      "correctOption": 0,
      "explanation": "Nhiệt lượng tỏa ra của đồng: $Q_{đ}=m_{đ} c_{đ} \\Delta t_{đ}=0,6.380.(100-30)=15960$ J\n \n Nhiệt lượng thu vào của nước $Q_{n}=m_{n} c_{n} \\Delta t_{n}=2,5.4200. \\Delta t_{n}$\n \n Theo phương trình cân bằng nhiệt: $Q_{đ}=Q_{n} \\Rightarrow 15960=2,5.4200. \\Delta t_{n} \\Rightarrow \\Delta t_{n}=1,52^\\circ C$."
    },
    {
      "id": "b5-ex-37",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một móng ngựa bằng sắt nặng $1,5 \\ kg$, ban đầu ở nhiệt độ $600^\\circ C$, rơi vào một cái xô chứa $20 \\ kg$ nước ở nhiệt độ $25^\\circ C$. Coi xô cách nhiệt hoàn toàn và giả sử lượng bốc hơi không đáng kể. Biết nhiệt dung riêng của nước và sắt lần lượt là $4200\\ J/kg.K$ và $448 \\ J / kg.K$. Nhiệt độ của hệ khi cân bằng nhiệt là",
      "options": [
        "$29,6^\\circ C$",
        "$40,5^\\circ C$",
        "$15,0^\\circ C$",
        "$80,0^\\circ C$"
      ],
      "correctOption": 0,
      "explanation": "- Nhiệt lượng mà móng ngựa ở nhiệt độ cao tỏa ra là\n \n Q_{tỏa}=m_{F e} c_{F e}\\left(t-t_{F e}\\right)\n \n - Nhiệt lượng mà nước trong xô thu vào là\n \n Q_{thu}=m_{n} c_{n}\\left(t_{n}-t\\right)\n \n - Nhiệt lượng tỏa ra bằng nhiệt lượng thu vào $Q_{tỏa}=Q_{thu}$\n - Nhiệt độ cuối cùng của hệ là\n \n t=\\dfrac{m_{n} c_{n} c_{n} t_{n}+m_{F e} c_{F e} t_{F e}}{m_{n} c_{n}+m_{F e} c_{F e}}=\\dfrac{20 . 4200 . 25+1,5 . 448 . 600}{1,5 . 448+20 . 4200}=29,6^\\circ C"
    },
    {
      "id": "b5-ex-38",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6G1-2][Loai4]\n Thả một quả cầu bằng nhôm khối lượng 0,105 kg được đun nóng tới $142^\\circ C$ vào một cốc đựng nước ở $20^\\circ C$, biết nhiệt độ khi có sự cân bằng nhiệt là $42^\\circ C$. Bỏ qua sự truyền nhiệt cho cốc và môi trường bên ngoài. Biết nhiệt dung riêng của nhôm là $880\\ J/kg.K$ và của nước là $4200\\ J/kg.K$. Khối lượng của nước trong cốc là",
      "options": [
        "5,01 kg",
        "1,05 kg",
        "0,1 kg",
        "1,5 kg"
      ],
      "correctOption": 2,
      "explanation": "- Nhiệt lượng nước thu vào để tăng tới $42^\\circ C$ là:\n \n Q_{thu}=m.4200.\\left( {42 - 20} \\right) = 92400m.\n \n - Nhiệt lượng quả cầu tỏa ra để giảm tới $42^\\circ C$ là: \n \n Q_{toả}=0,105.880.\\left( {142 - 42} \\right)= 9240\\ J.\n \n - Khi cân bằng nhiệt thì: $Q_{thu}=Q_{toả}\\Rightarrow 9240 = 92400m \\to m = 0,1\\ kg.$\n \n =\\sum Q_{toả}$. Khi tính như vậy thì Q luôn dương}"
    },
    {
      "id": "b5-ex-39",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Để xác định nhiệt dung riêng của một kim loại, người ta bỏ vào nhiệt lượng kế chứa $500 \\ g$ nước ở nhiệt độ $15^\\circ C$ một miếng kim loại có $m=400 \\ g$ được đun nóng tới $100^\\circ C$. Nhiệt độ khi có sự cân bằng nhiệt là $20^\\circ C$. Bỏ qua nhiệt lượng làm nóng nhiệt lượng kế và không khí. Cho nhiệt dung riêng của nước là $4180 \\ J /kg.K$. Nhiệt dung riêng của miếng kim loại là",
      "options": [
        "$326,6 \\ J / kg. K$",
        "$236,6 \\ J / kg. K$",
        "$632,6 \\ J / kg. K$",
        "$764,6 \\ J / kg. K$"
      ],
      "correctOption": 0,
      "explanation": "$c=326,6 \\ J / kg. K$"
    },
    {
      "id": "b5-ex-40",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6-1.2G][Loai3]\n Để xác định nhiệt độ của một lò nung, người ta đưa vào trong lò một miếng sắt có khối lượng $50\\ g$. Khi miếng sắt có nhiệt độ bằng nhiệt độ của lò, người ta lấy ra và thả nó vào một nhiệt lượng kế chứa $900\\ g$ nước ở nhiệt độ $17^\\circ C$. Khi đó nhiệt độ của nước tăng lên đến $23^\\circ C$. Biết nhiệt dung riêng của sắt là $478\\ J/kg.K$, của nước là $4180\\ J/kg.K$. Bỏ qua sự trao đổi nhiệt với môi trường và với nhiệt lượng kế. Nhiệt độ của lò xấp xỉ bằng",
      "options": [
        "$813^\\circ C$",
        "$796^\\circ C$",
        "$990^\\circ C$",
        "$967^\\circ C$"
      ],
      "correctOption": 3,
      "explanation": "- Nhiệt lượng do nước thu vào là:\n \n Q_{thu}=0,9.4180.\\left( {23 - 17} \\right) = 22572\\ J.\n \n - Nhiệt lượng do sắt tỏa ra là:\n \n Q_{tỏa}=0,05.478.\\left( {t - 23} \\right) = 23,9t - 549,7.\n \n - Khi cân bằng nhiệt thì:\n \n Q_{thu}=Q_{tỏa}\\to 22572 = 23,9t - 549,7\\to t = 967^\\circ C."
    },
    {
      "id": "b5-ex-41",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một quả cầu nhôm có khối lượng $0,15 \\ kg$ được đun nóng tới nhiệt độ $t_1=$ $150^\\circ C$ rồi thả vào chậu nước ở nhiệt độ $t_2=25^\\circ C$. Sau một thời gian nhiệt độ của cả hệ là $t=30^\\circ C$. Xem nhiệt lượng chỉ trao đổi giữa nước và quả cầu. Biết nhiệt dung riêng của nước là $4180 \\ J/kg.K$ và của nhôm là $880 \\ J/kg.K$. Khối lượng của nước là",
      "options": [
        "0,578 kg",
        "0,857 kg",
        "0,758 kg",
        "0,785 kg"
      ],
      "correctOption": 2,
      "explanation": "- Ta có: $T_1=t_1+273=423 \\ K, \\ T_2=t_2+273=298 \\ K, \\ T=t+273=303 \\ K$\n - Nhiệt lượng quả cầu nhôm tỏa ra khi hạ nhiệt từ $150^\\circ C$ xuống $30^\\circ C$:\n - $Q_1=m_1 c_1\\left(\\ T_1-T\\right)=0,15.880.(423-303)=15840 \\ J$\n - Nhiệt lượng nước thu vào để nó tăng nhiệt độ từ $25^\\circ C$ đến $30^\\circ C$:\n - $Q_2=m_2. c_2\\left(\\ T-T_2\\right)=m_2 . 4180.(303-298)=20900 \\ m_2 \\ J$\n - Theo phương trình cân bằng nhiệt: $Q_1=Q_2$\n - Tính được: $m_2=0,758 \\ kg$."
    },
    {
      "id": "b5-ex-42",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một người muốn làm tăng nhiệt độ của $20 \\ kg$ nước ở $20^\\circ C$ tăng lên đến $40^\\circ C$. Bỏ qua sự trao đổi nhiệt của nước với môi trường và bình chứa. Khối lượng của nước ở $100^\\circ C$ cần dùng để pha vào lượng nước trên là",
      "options": [
        "$9,67\\ kg$",
        "$6,76\\ kg$",
        "$7,67\\ kg$",
        "$6,67\\ kg$"
      ],
      "correctOption": 3,
      "explanation": "- $T_1=t_1+273=293 \\ K, \\ T_2=t_2+273=313 \\ K, \\ T_3=t_3+273=373 \\ K$\n - Nhiệt lượng $20 \\ kg$ nước thu vào để tăng nhiệt độ từ $20^\\circ C$ đến $40^\\circ C$\n \n $Q_1=m_1.c. \\left(T_2-T_1\\right)=20. c.(313-293)=400 c$\n - Nhiệt lượng do khối nước nóng tỏa ra khi hạ nhiệt từ $100^\\circ C$ xuống $40^\\circ C$.\n \n $Q_2=m_2.c. \\left(T_3-T_2\\right)=m_2$.c. $(373-313)=60 \\ m_2 c$\n - Từ $Q_1=Q_2$, tính được $m_2=6,67 \\ kg$."
    },
    {
      "id": "b5-ex-43",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6-1.2T][Loai6] \n Một bình nhôm khối lượng $0,5\\ kg$ chứa $0,118\\ kg$ nước ở nhiệt độ $20^\\circ C$. Người ta thả vào bình một miếng sắt khối lượng $0,2\\ kg$ đã được nung nóng tới $75^\\circ C$. Bỏ qua sự truyền nhiệt ra môi trường bên ngoài. Nhiệt dung riêng của nhôm là $896\\ J/kg.K$; của nước là $4180\\ J/kg.K$, của sắt là $460\\ J/kg.K$. Nhiệt độ của nước khi bắt đầu có sự cân bằng nhiệt là",
      "options": [
        "$23,6^\\circ C$",
        "$29,4^\\circ C$",
        "$25,2^\\circ C$",
        "$24,9^\\circ C$"
      ],
      "correctOption": 3,
      "explanation": "- Nhiệt lượng trao đổi của bình nhôm: $Q_{Al} = m_{Al}c_{Al}(t - t_1)$.\n - Nhiệt lượng trao đổi của nước: $Q_{H_2O} = m_{H_2O}c_{H_2O}(t - t_1)$.\n - Nhiệt lượng trao đổi của sắt: $Q_{Fe} = m_{Fe}c_{Fe}(t - t_2)$.\n - Khi có cân bằng nhiệt: \n \n Q_{Al} +Q_{H_2O}+Q_{Fe}=0 \\Rightarrow t \\approx 24,9^{\\circ}C."
    },
    {
      "id": "b5-ex-44",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6-1.2T][Loai8] \n Một nhiệt lượng kế bằng đồng khối lượng có $100\\ g$ chứa $375\\ g$ nước ở nhiệt độ $25^\\circ C$. Cho vào nhiệt lượng kế một vật bằng kim loại khối lượng $400\\ g$ ở $90^\\circ C$. Biết nhiệt độ khi có sự cân bằng nhiệt là $30^\\circ C$. Bỏ qua sự trao đổi nhiệt với môi trường. Cho biết nhiệt dung riêng của đồng là $380\\ J/kg.K$ và của nước là $4200\\ J/kg.K$. Nhiệt dung riêng của miếng kim loại là",
      "options": [
        "$633\\ J/kg. K$",
        "$336\\ J/kg. K$",
        "$362\\ J/kg. K$",
        "$880\\ J/kg. K$"
      ],
      "correctOption": 1,
      "explanation": "- Nhiệt lượng trao đổi của nhiệt lượng kế: $Q_{NLK} = m_{Cu}c_{Cu}(t - t_1)$.\n - Nhiệt lượng trao đổi của nước: $Q_{H_2O} = m_{H_2O}c_{H_2O}(t - t_1)$.\n - Nhiệt lượng trao đổi của kim loại: $Q_{Kl} = m_{Kl}c_{Kl}(t - t_2)$.\n - Khi có cân bằng nhiệt: \n $Q_{NLK} +Q_{H_2O}+Q_{Kl}=0 \\Rightarrow c_{Kl} = 336\\ J/kg.K.$"
    },
    {
      "id": "b5-ex-45",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "%[1P6-1.2T][Loai6]\n Trộn ba chất lỏng không tác dụng hoá học lẫn nhau. Biết $m_1=1\\ kg$, $m_2=10\\ kg$, $m_3=5\\ kg$, $t_1=6^{\\circ}C$, $t_2=-40^{\\circ}C$, $t_3=60^{\\circ}C$, $c_1=2\\ kJ/kg.K$, $c_2=4\\ kJ/kg.K$, $c_3=2\\ kJ/kg.K$. Coi nhiệt chỉ trao đổi giữa các chất lỏng. Nhiệt độ khi cân bằng là",
      "options": [
        "$t=-11^{\\circ}C$",
        "$t=-19^{\\circ}C$",
        "$t=-29^{\\circ}C$",
        "$t=19^{\\circ}C$"
      ],
      "correctOption": 1,
      "explanation": "- Theo điều kiện cân bằng nhiệt: \n \n Q_1+Q_2+Q_3=0\\Rightarrow =m_1.c_1.(t-t_1)+m_2.c_2.(t-t_2)+m_3.c_3.(t-t_3)= 0 \\Rightarrow t=-19^{\\circ}C."
    },
    {
      "id": "b5-ex-46",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một nhiệt lượng kế bằng đồng có khối lượng $0,1 \\ kg$ chứa $0,5 \\ kg$ nước ở $20^\\circ C$. Người ta thả vào nhiệt lượng kế nói trên một thỏi đồng có khối lượng $0,2 \\ kg$ đã được đun nóng đến $200^\\circ C$. Cho biết nhiệt dung riêng của đồng là $380 \\ J /kg.K$ và của nước là $4200 \\ J /kg.K$. Bỏ qua sự trao đổi nhiệt với môi trường. Nhiệt độ cuối cùng của hệ là",
      "options": [
        "$28,2^\\circ C$",
        "$28^\\circ C$",
        "$27,4^\\circ C$",
        "$26,2^\\circ C$"
      ],
      "correctOption": 3,
      "explanation": "- Nhiệt lượng mà nhiệt lượng kế thu vào\n \n Q_1=m_1 c_1\\left(t_2-t_1\\right)=0,1 . 380.\\left(t_2-20\\right)=38\\left(t_2-20\\right)\n \n - Nhiệt lượng nước thu vào\n \n Q_2=m_2 . c_2\\left(t_2-t_1\\right)=0,5 . 4200 .\\left(t_2-20\\right)=2100.\\left(t_2-20\\right)\n \n - Nhiệt lượng đồng tỏa ra\n \n Q_3=m_3 . c_1 .\\left(t_3-t_2\\right)=1,2 . 380 .\\left(200-t_2\\right)=76 .\\left(200-t_2\\right)\n \n - Theo phương trình cân bằng nhiệt ta có: $Q=Q_1+Q_2$\n \n & \\Rightarrow 38. t_2-760+2100 t_2-4200=15200-t_2 \n \\Rightarrow t_2\\approx 26,2^\\circ C"
    },
    {
      "id": "b5-ex-47",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Người ta trộn một hỗn hợp từ ba chất lỏng không có tác dụng hóa học với nhau có khối lượng $m_1=1 \\ kg, \\ m_2=2 \\ kg, \\ m_3=3 \\ kg$, các chất lỏng có nhiệt độ lần lượt là $t_1=10^\\circ C,\\ t_2=20^\\circ C$ và $t_3=30^\\circ C$. Biết nhiệt dung riêng của các chất lỏng lần lượt là $c_1=2500 \\ J/kg.K$, $c_2=4200 \\ J/kg.K$ và $c_3=3900 \\ J/kg.K$. Bỏ qua sự trao đổi nhiệt với môi trường bên ngoài. Nhiệt độ của hỗn hợp khi nó đạt trạng thái cân bằng nhiệt là",
      "options": [
        "$24,1^\\circ C$",
        "$14,1^\\circ C$",
        "$34,1^\\circ C$",
        "$44,1^\\circ C$"
      ],
      "correctOption": 0,
      "explanation": "Khi hỗn hợp đạt trạng thái cân bằng nhiệt:\n \n &m_1 c_1\\left(t_1-t\\right)+m_2 c_2\\left(t_1-t\\right)+m_3 c_3\\left(t_3-t\\right)=0\\\\\n &t=\\dfrac{m_1 c_1 t_1+m_2 c_2 t_2+m_3 c_3 t_3}{\\ m_1 c_1+m_2 c_2+m_3 c_3}=24,1^\\circ C"
    },
    {
      "id": "b5-ex-48",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Một miếng ghép có tổng khối lượng $m=50 \\ g$ từ chì và kẽm ở $136^\\circ C$ được thả vào một nhiệt lượng kế. Nhiệt lượng kế có nhiệt dung $30\\ J/K$ và chứa $100 \\ g$ nước ở $14^\\circ C$. Nhiệt độ khi cân bằng nhiệt là $18^\\circ C$. Biết nhiệt dung riêng của nước là $c_0=4200 \\ J /kg.K$, của chì là $c_1=130 \\ J /kg.K$, của kẽm là $c_2=380 \\ J /kg.K$. Bỏ qua sự trao đổi nhiệt với môi trường bên ngoài. Khối lượng chì là",
      "options": [
        "$15 \\ g$",
        "$25 \\ g$",
        "$5 \\ g$",
        "$35 \\ g$"
      ],
      "correctOption": 0,
      "explanation": "- Phương trình cân bằng nhiệt cho hệ: \n \n & Q_1+Q_2+Q_3+Q_4=0\\\\\n \\Leftrightarrow \\ & c_1 m_1\\left(t-t_1\\right)+c_2 m_2\\left(t-t_2\\right)+c_3 m_3\\left(t-t_3\\right)+c_0 m_0\\left(t-t_4\\right)=0\n \n - Trong đó: \n \n - $t_1=t_2=136^\\circ C;\\ t_3=t_{4}=14^\\circ C;\\ c_3 m_3=30 \\ J / K;\\ t=18^\\circ C$;\n - $c_1=130 \\ J / g . K;\\ c_2=380 \\ J / kg . K;\\ c_0=4200 \\ J / kg . K;\\ m_0=100 \\ g.$ \n \n \n & \\Rightarrow 130 . m_1.(18-136)+380 . (0,05-m_1).(18-136)+30.(18-14)+4200 . 0,1.(18-14)=0 \\qquad \\text {(1)}\n \n \n - Giải (1) ta được: $m_1\\approx 15 \\ g$."
    },
    {
      "id": "b5-ex-49",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Người ta nung nóng miếng đồng có khối lượng $100 \\ g$ đến nhiệt độ $650^\\circ C$ rồi thả vào cốc nước có thể tích 1 lít đang có nhiệt độ $30^\\circ C$. Giả sử cốc nước được làm từ vật liệu cách nhiệt rất tốt và bỏ qua sự trao đổi nhiệt với môi trường bên ngoài. Biết khối lượng riêng của nước là $1000 \\ kg / m^3$ và nhiệt dung riêng của đồng và của nước lần lượt là $c_1=380 \\ J/kg.K$ và $c_2=4180 \\ J/kg.K$.",
      "options": [
        "Đã có quá trình truyền nhiệt từ miếng đồng sang nước",
        "Khi hệ đã cân bằng nhiệt, so với ban đầu thì nội năng của miếng đồng đã giảm xuống, còn của nước tăng lên",
        "Khi hệ đã cân bằng nhiệt, nhiệt độ của của nước trong cốc là $40,5^\\circ C$",
        "Độ biến thiên nội năng của miếng đồng xấp xỉ là $23348 \\ J$"
      ],
      "correctOption": 1,
      "explanation": ""
    },
    {
      "id": "b5-ex-50",
      "type": "Dạng 3: Phương trình cân bằng nhiệt",
      "question": "Để xác định nhiệt độ của một lò, người ta đưa vào lò một miếng sắt khối lượng $75 \\ g$. Khi miếng sắt có nhiệt độ bằng nhiệt độ của lò, người ta lấy ra và thu ngay vào một nhiệt lượng kế có khối lượng $200 \\ g$ có chứa $500 \\ g$ nước ở nhiệt độ $30^\\circ C$, khi hệ cân bằng nhiệt thì nhiệt độ của nước tăng lên đến $45^\\circ C$. Coi nhiệt dung riêng của nước gần đúng là $4200 \\ J/kg.K$, của sắt là $478 \\ J/kg.K$ và của nhiệt lượng kế là $418 \\ J/kg.K$. Giả sử hệ không trao đổi nhiệt với môi trường bên ngoài.",
      "options": [
        "Trong quá trình trên độ giảm nội năng của miếng sắt bằng độ tăng nội năng của nước",
        "Độ tăng nội năng của nước là $31500 \\ J$",
        "Nhiệt độ của lò xấp xỉ là $958,6^\\circ C$",
        "Miếng sắt đã truyền một nhiệt lượng là $35052 \\ J$ cho nước và nhiệt lượng kế"
      ],
      "correctOption": 2,
      "explanation": ""
    },
    {
      "id": "b5-ex-51",
      "type": "Dạng 4: Chuyển hóa năng lượng thành nội năng",
      "question": "Người ta cọ xát hai vật với nhau, nhiệt dung của hai vật bằng nhau và bằng $800\\ J / K$. Sau 1 phút người ta thấy nhiệt độ của mỗi vật tăng thêm $30\\ K$. Công suất trung bình của việc cọ xát bằng",
      "options": [
        "$1080\\ W$",
        "$980\\ W$",
        "$480\\ W$",
        "$800\\ W$"
      ],
      "correctOption": 3,
      "explanation": "Toàn bộ công cọ xát chuyển hết thành nhiệt của 2 vật\n $$\n A=Q \\Rightarrow P t=2 m c \\Delta t \\Rightarrow P . 60=2.800.30 \\Rightarrow P=800\\ W \n $$"
    },
    {
      "id": "b5-ex-52",
      "type": "Dạng 4: Chuyển hóa năng lượng thành nội năng",
      "question": "Trong một thí nghiệm, người ta thả rơi tự do một mảnh thép từ độ cao $500\\ m$, khi tới sát mặt đất nó có tốc độ $50\\ m/s$. Cho biết nhiệt dung riêng của thép $c=460\\ J/kg.K$ và lấy $g=10\\ m/s^2$. Mảnh thép đã nóng thêm bao nhiêu độ ngay trước khi chạm đất, nếu cho rằng toàn bộ công cản của không khí chỉ dùng để làm nóng mảnh thép?",
      "options": [
        "$9,25\\ K$",
        "$8,15\\ K$",
        "$7,15\\ K$",
        "$9,18\\ K$"
      ],
      "correctOption": 1,
      "explanation": "$Q=W_1-W_2 \\Rightarrow m c \\Delta t=m g h-\\dfrac{1}{2} m v^2 \\Rightarrow \\Delta t=\\dfrac{g h-\\dfrac{1}{2} v^2}{c}=\\dfrac{10.500-\\dfrac{1}{2}.50^2}{460} \\approx 8,15\\ K$."
    },
    {
      "id": "b5-ex-53",
      "type": "Dạng 4: Chuyển hóa năng lượng thành nội năng",
      "question": "Xác định độ biến thiên nhiệt độ của nước rơi từ độ cao $96\\ m$ xuống và đập vào cánh tuabin làm quay máy phát điện, biết rằng $50 \\%$ thế năng ban đầu của nước biến thành nội năng của nước. Cho biết nhiệt dung riêng của nước là $4190\\ J/kg.K$. Chọn mốc thế năng tại mặt đất. Lấy $g=9,8\\ m/s^2$.",
      "options": [
        "$1,25\\ K$",
        "$1,42\\ K$",
        "$0,11\\ K$",
        "$0,18\\ K$"
      ],
      "correctOption": 2,
      "explanation": "$Q=H W \\Rightarrow m c \\Delta t=H. m g h \\Rightarrow \\Delta t=\\dfrac{H g h}{c}=\\dfrac{0,5.9,8.96}{4190} \\approx 0,11\\ K$"
    },
    {
      "id": "b5-ex-54",
      "type": "Dạng 4: Chuyển hóa năng lượng thành nội năng",
      "question": "__IMMINI__Thác nước thiên thần ở Venezuela có chiều cao nước đổ là $807 \\ m$, là thác cao nhất thế giới. Nếu nước trên đỉnh thác có nhiệt độ là $15^\\circ C$, thì nhiệt độ cao nhất ở dưới chân thác là bao nhiêu? Giả sử toàn bộ năng lượng của thác khi chảy xuống đáy được sử dụng để tăng nhiệt độ của nước. Biết nhiệt dung riêng của nước là 4200 J/kg.K. Lấy $g=9,8\\ m/s^2$.",
      "options": [
        "$16,9^\\circ C$",
        "$20,1^\\circ C$",
        "$23^\\circ C$",
        "$15,0^\\circ C$"
      ],
      "correctOption": 0,
      "explanation": "- Giả sử khối lượng của nước là $m (kg)$\n - Giả sử toàn bộ năng lượng của thác khi chảy xuống đáy được sử dụng để tăng nhiệt độ của nước:\n \n & m.g.h=m.c.\\Delta t \\\\\n \\Rightarrow \\ & \\Delta t=\\dfrac{g h}{c}=\\dfrac{9,8 . 807}{4200}=1,883^\\circ C\n \n - Nhiệt độ ở dưới chân thác là\n \n t=15+1,883 \\approx 16,9^\\circ C"
    },
    {
      "id": "b5-ex-55",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Khi dùng lò hiệu suất $H_1$ để làm chảy một lượng quặng, phải đốt hết $m_1$ kilôgam nhiên liệu có năng suất toả nhiệt $q_1$. Nếu dùng lò có hiệu suất $H_2$ để làm chảy lượng quặng trên, phải đốt hết\n $m_2=3m_1$ kilôgam nhiên liệu có năng suất toả nhiệt $q_2=0,5 q_1$. Khi đó",
      "options": [
        "$H_1=H_2$",
        "$H_1=2 H_2$",
        "$H_1=3 H_2$",
        "$H_1=1,5 H_2$"
      ],
      "correctOption": 3,
      "explanation": "$H=\\dfrac{Q_{q}}{Q}=\\dfrac{Q_{q}}{q m} \\Rightarrow \\dfrac{H_1}{H_2}=\\dfrac{q_2}{q_1} . \\dfrac{m_2}{m_1}=0,5 . 3=1,5$."
    },
    {
      "id": "b5-ex-56",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Người ta dùng một máy hơi nước hiệu suất $10 \\%$ để đưa $720\\ m^3$ nước lên độ cao $9\\ m$. Biết năng suất tỏa nhiệt của than đá là $27 . 10^{6}\\ J/kg$. Lấy $g=10\\ m/s^2$. Lượng than đá tiêu thụ là",
      "options": [
        "$22\\ kg$",
        "$23\\ kg$",
        "$24\\ kg$",
        "$25\\ kg$"
      ],
      "correctOption": 2,
      "explanation": "$A=m g h=V \\rho g h=720 . 10^3 . 10 . 9=6,48 . 10^{7}\\ J$\n \n $Q=\\dfrac{A}{H}=\\dfrac{6,48 . 10^{7}}{0,1}=64,8 . 10^{7}\\ J$\n \n $m=\\dfrac{Q}{q}=\\dfrac{64,8 . 10^{7}}{27 . 10^{6}}=24\\ kg$."
    },
    {
      "id": "b5-ex-57",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Động cơ của một máy bay có công suất $2.10^{6} \\ W$ và hiệu suất $30 \\%$. Biết năng suất toả nhiệt của xăng là $4,6 . 10^{7} \\ J / kg$. Với một tấn xăng, máy bay có thể bay được trong",
      "options": [
        "0,92 giờ",
        "3,92 giờ",
        "1,92 giờ",
        "2,92 giờ"
      ],
      "correctOption": 2,
      "explanation": "- 1 tấn $=1000 \\ kg$\n \n - Năng lượng do một tấn xăng toả ra: $Q=mq=1000 . 4,6 . 10^{7}=4,6 . 10^{10} \\ J$\n - Ta có: $H=\\dfrac{A}{Q}$\n \n - Công do máy bay động cơ sinh ra: $A=H . Q=0,30 . 4,6 . 10^{10}=1,38 . 10^{10} \\ J$\n - Thời gian máy bay bay là: $t=\\dfrac{A}{\\mathcal{P}}=\\dfrac{1,38 . 10^{10}}{2.10^{6}}=6900=1,92\\ h$"
    },
    {
      "id": "b5-ex-58",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Một đầu máy điezen xe lửa có công suất $3 . 10^{6}\\ W$ và có hiệu suất là $25 \\%$. Cho biết năng suất tỏa nhiệt của nhiên liệu là $4,2.10^7\\ J/kg$. Nếu đầu máy chạy hết công suất thì khối lượng nhiên liệu tiêu thụ trong mỗi giờ là",
      "options": [
        "$2489\\ kg$",
        "$1429\\ kg$",
        "$1029\\ kg$",
        "$1056\\ kg$"
      ],
      "correctOption": 2,
      "explanation": "$A=\\mathcal{P} t=3.10^{6} . 3600=1080.10^{7}\\ J$\n \n $H=\\dfrac{A}{Q_1} \\Rightarrow 0,25=\\dfrac{1080 . 10^{7}}{Q_1} \\Rightarrow Q_1=4320.10^{7}\\ J$\n \n $Q_1=q m \\Rightarrow 4320 . 10^{7}=4,2 . 10^{7}. m \\Rightarrow m \\approx 1028,6\\ kg$."
    },
    {
      "id": "b5-ex-59",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Động cơ nhiệt đã tiêu tốn lượng xăng $100 \\ g$. Biết năng suất tỏa nhiệt của xăng là $46 . 10^{6} \\ J / kg$ và hiệu suất của động cơ là $20 \\%$. Động cơ thực hiện công có ích là",
      "options": [
        "$460000 \\ J$",
        "$920000 \\ J$",
        "$46000 \\ J$",
        "$92000 \\ J$"
      ],
      "correctOption": 1,
      "explanation": ""
    },
    {
      "id": "b5-ex-60",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Trên quãng đường $120 \\ km$, một ô tô chuyển động với vận tốc $54 \\ km / h$ thì tiêu thụ hết 8 lít xăng. Biết công suất của động cơ là $12 \\ kW$ và năng suất tỏa nhiệt của xăng là $46.10^{6} \\ J / kg$, khối lượng riêng của xăng là $700 \\ kg / m^3$. Hiệu suất của động cơ ô tô là",
      "options": [
        "$27,72 \\%$",
        "$37,27 \\%$",
        "$37,72 \\%$",
        "$27.27 \\%$"
      ],
      "correctOption": 1,
      "explanation": ""
    },
    {
      "id": "b5-ex-61",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Một ô tô có lực kéo $1000 \\ N$, tiêu thụ hết $5 \\ kg$ xăng. Biết khi đốt cháy hoàn toàn $1 \\ kg$ xăng ta thu được nhiệt lượng $46 . 10^{6} \\ J$. Hiệu suất của động cơ là $25 \\%$. Quãng đường ô tô đi được là",
      "options": [
        "$28,75 \\ km$",
        "$57,5 \\ km$",
        "$115 \\ km$",
        "$230 \\ km$"
      ],
      "correctOption": 1,
      "explanation": ""
    },
    {
      "id": "b5-ex-62",
      "type": "Dạng 5: Hiệu suất động cơ nhiệt",
      "question": "Mỗi giờ động cơ nhiệt chạy bằng than thực hiện một công là $4,05.10^7 \\ J$. Biết khi đốt cháy hoàn toàn $1 \\ kg$ than thì ta thu được một nhiệt lượng $36.10^{6} \\ J$ và hiệu suất của động cơ là $10 \\%$. Lượng than mà động cơ nhiệt tiêu thụ trong một giờ là",
      "options": [
        "$1,125 \\ kg$",
        "$11,25 \\ kg$",
        "$11,25 \\ g$",
        "$112,5 \\ g$"
      ],
      "correctOption": 1,
      "explanation": ""
    }
  ]
};
