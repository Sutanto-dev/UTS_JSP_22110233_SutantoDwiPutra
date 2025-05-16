<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String namaPemesan = request.getParameter("namaPemesan");
String jamTayang = request.getParameter("jamTayang");
int filmId = Integer.parseInt(request.getParameter("filmId"));
int jumlahTiket = Integer.parseInt(request.getParameter("jumlahTiket"));
int hargaTiket = Integer.parseInt(request.getParameter("hargaTiket"));
int totalHarga = jumlahTiket * hargaTiket;

ArrayList<HashMap<String, Object>> daftarFilm = (ArrayList<HashMap<String, Object>>) session.getAttribute("daftarFilm");
if (daftarFilm == null) {
    response.sendRedirect("index.jsp");
    return;
}

HashMap<String, Object> filmDipilih = daftarFilm.get(filmId);
String judulFilm = (String) filmDipilih.get("judul");

HashMap<String, Object> dataPemesanan = new HashMap<>();
dataPemesanan.put("namaPemesan", namaPemesan);
dataPemesanan.put("judulFilm", judulFilm);
dataPemesanan.put("jamTayang", jamTayang);
dataPemesanan.put("jumlahTiket", jumlahTiket);
dataPemesanan.put("hargaTiket", hargaTiket);
dataPemesanan.put("totalHarga", totalHarga);
session.setAttribute("dataPemesanan", dataPemesanan);
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NontonLagi - Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #0c111b;
            --secondary-color: #1f2937;
            --accent-color: #008080;
            --text-color: #008080;
            --card-bg: #222b3a;
            --border-dashed: #3b475a;
        }
        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding: 2rem 0;
        }
        .container {
            max-width: 600px;
        }
        .receipt {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 30px 25px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.7);
        }
        .receipt-header {
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 1px dashed var(--border-dashed);
            padding-bottom: 15px;
        }
        .receipt-header h2 {
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 0.25rem;
        }
        .receipt-header p {
            font-weight: 500;
            font-size: 0.9rem;
            color: #a0aec0;
        }
        .receipt-content {
            margin-bottom: 25px;
        }
        .receipt-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-weight: 600;
        }
        .receipt-item div:last-child {
            font-weight: 700;
            color: var(--accent-color);
        }
        .receipt-total {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #38465e;
            font-size: 1.3rem;
            font-weight: 800;
            color: var(--accent-color);
            display: flex;
            justify-content: space-between;
        }
        .receipt-footer {
            text-align: center;
            border-top: 1px dashed var(--border-dashed);
            padding-top: 20px;
            color: #718096;
            font-weight: 500;
            font-size: 0.85rem;
            margin-bottom: 25px;
        }
        .receipt-footer p:first-child {
            color: var(--accent-color);
            font-weight: 700;
            margin-bottom: 5px;
        }
        .thank-you {
            text-align: center;
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: var(--text-color);
        }
        .btn-primary {
            background-color: var(--accent-color);
            border: none;
            font-weight: 700;
            padding: 0.75rem 0;
            font-size: 1.1rem;
            border-radius: 10px;
            width: 100%;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #005b5b;
        }
        .btn-outline-secondary {
            color: var(--accent-color);
            border-color: var(--accent-color);
            font-weight: 600;
            width: 100%;
            padding: 0.65rem 0;
            border-radius: 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .btn-outline-secondary:hover {
            background-color: var(--accent-color);
            color: var(--text-color);
        }
        @media (max-width: 576px) {
            .receipt {
                padding: 20px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container mx-auto">
        <div class="receipt">
            <div class="receipt-header">
                <h2>NontonLagi</h2>
                <p>Struk Pemesanan Tiket</p>
                <p class="text-muted"><%= new Date().toString() %></p>
            </div>
            <div class="receipt-content">
                <div class="receipt-item">
                    <div>Nama Pemesan:</div>
                    <div class="text-white"><%= namaPemesan %></div>
                </div>
                <div class="receipt-item">
                    <div>Film:</div>
                    <div class="text-white"><%= judulFilm %></div>
                </div>
                <div class="receipt-item">
                    <div>Jam Tayang:</div>
                    <div class="text-white"><%= jamTayang %></div>
                </div>
                <div class="receipt-item">
                    <div>Jumlah Tiket:</div>
                    <div class="text-white"><%= jumlahTiket %></div>
                </div>
                <div class="receipt-item">
                    <div>Harga per Tiket:</div>
                    <div class="text-white">Rp <%= String.format("%,d", hargaTiket) %></div>
                </div>
                <div class="receipt-total">
                    <div>Total Harga:</div>
                    <div class="text-white" >Rp <%= String.format("%,d", totalHarga) %></div>
                </div>
            </div>
            <div class="receipt-footer">
                <p>Kode Pemesanan: <%= Math.abs(namaPemesan.hashCode()) + "-" + (System.currentTimeMillis() % 10000) %></p>
                <p>Silakan tunjukkan struk ini di kasir bioskop</p>
            </div>
            <div class="thank-you">
                <p>Terima kasih telah memilih NontonLagi!</p>
                <div class="d-grid gap-2">
                    <a href="index.jsp" class="btn btn-primary">Kembali ke Beranda</a>
                    <button class="btn btn-outline-secondary" onclick="window.print()">Cetak Struk</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
