<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String filmIdStr = request.getParameter("filmId");
int filmId = 0;
try {
    filmId = Integer.parseInt(filmIdStr);
} catch (Exception e) { }

ArrayList<HashMap<String, Object>> daftarFilm = (ArrayList<HashMap<String, Object>>) session.getAttribute("daftarFilm");
if (daftarFilm == null) {
    response.sendRedirect("index.jsp");
    return;
}

HashMap<String, Object> filmDipilih = daftarFilm.get(filmId);
String judul = (String) filmDipilih.get("judul");
String genre = (String) filmDipilih.get("genre");
int durasi = (int) filmDipilih.get("durasi");
int hargaTiket = (int) filmDipilih.get("hargaTiket");
String[] jamTayang = (String[]) filmDipilih.get("jamTayang");
String gambar = (String) filmDipilih.get("gambar");
String sinopsis = (String) filmDipilih.get("sinopsis");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NontonLagi - Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-color: #0c111b;
            --secondary-color: #1f2937;
            --accent-color: #008080;
            --text-color: #f9f9f9;
            --card-hover: #004444;
        }

        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        a.btn-outline-secondary {
            color: var(--text-color);
            border-color: var(--text-color);
            transition: background-color 0.3s, color 0.3s;
        }
        a.btn-outline-secondary:hover {
            background-color: var(--accent-color);
            color: var(--text-color);
            border-color: var(--accent-color);
        }

        header {
            text-align: center;
            margin-bottom: 2rem;
        }
        header h1 {
            font-weight: 800;
            font-size: 2.5rem;
        }
        header a {
            font-weight: 600;
            font-size: 1rem;
        }

        .container {
            flex-grow: 1;
        }

        .film-details {
            background-color: var(--secondary-color);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.6);
            margin-bottom: 2rem;
        }
        
        .film-image {
            text-align: center;
            background-color: #121926;
        }
        
        .film-image img {
            max-height: 400px;
            object-fit: cover;
        }
        
        .film-info {
            padding: 20px;
        }
        
        .genre-duration {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .badge {
            background-color: #121926;
            font-weight: 500;
            padding: 8px 15px;
        }

        .card {
            background-color: var(--secondary-color);
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.6);
            color: var(--text-color);
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
        }

        input.form-control, input.form-control:focus {
            background-color: #273043;
            border: 1px solid #444c5c;
            color: var(--text-color);
        }
        input.form-control::placeholder {
            color: #8ea0b1;
        }

        .form-check-input {
            background-color: var(--secondary-color);
            border-color: #555f72;
        }
        .form-check-input:checked {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        .jam-option {
            margin-right: 15px;
        }

        button.btn-primary, .btn-book {
            background-color: var(--accent-color);
            border: none;
            font-weight: 700;
            padding: 0.75rem;
            font-size: 1.1rem;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }
        button.btn-primary:hover, .btn-book:hover {
            background-color: #005b5b;
        }
        
        .section-title {
            color: var(--text-color);
            opacity: 0.75;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .jam-tayang-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 15px;
        }
        
        .jam-badge {
            background-color: var(--accent-color);
            color: white;
            padding: 5px 12px;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .film-image img {
                max-height: 300px;
            }
        }
        
        @media (max-width: 576px) {
            .film-image img {
                max-height: 250px;
            }
            .film-info {
                padding: 15px;
            }
            button.btn-primary {
                font-size: 1rem;
                padding: 0.6rem;
            }
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <header>
            <h1>Form Pemesanan Tiket</h1>
        </header>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="film-details">
                    <div class="film-image">
                        <img src="<%= gambar %>" alt="<%= judul %>" class="img-fluid" />
                    </div>
                    <div class="film-info">
                        <h3 class="fs-4 fw-bold mb-3"><%= judul %></h3>
                        
                        <div class="genre-duration">
                            <span class="badge"><%= genre %></span>
                            <span class="badge"><%= durasi %> menit</span>
                        </div>
                        
                        <div class="mb-3">
                            <h6 class="section-title">Sinopsis</h6>
                            <p style="line-height: 1.6;"><%= sinopsis %></p>
                        </div>
                        
                        <div class="mb-3">
                            <h6 class="section-title">Harga Tiket</h6>
                            <p class="fs-5 fw-bold">Rp <%= String.format("%,d", hargaTiket) %></p>
                        </div>
                        
                        <div class="mb-3">
                            <h6 class="section-title">Jam Tayang</h6>
                            <div class="jam-tayang-list">
                                <% for (String jam : jamTayang) { %>
                                    <span class="jam-badge"><%= jam %></span>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Booking form card -->
                <div class="card p-4">
                    <h4 class="mb-4">Detail Pemesanan</h4>
                    <form action="struk.jsp" method="post" novalidate>
                        <input type="hidden" name="filmId" value="<%= filmId %>">
                        <input type="hidden" name="hargaTiket" value="<%= hargaTiket %>">

                        <div class="mb-3">
                            <label for="namaPemesan" class="form-label">Nama Pemesan</label>
                            <input type="text" class="form-control" id="namaPemesan" name="namaPemesan" placeholder="Masukkan nama lengkap" required />
                        </div>

                        <div class="mb-3">
                            <label for="jumlahTiket" class="form-label">Jumlah Tiket</label>
                            <input type="number" class="form-control" id="jumlahTiket" name="jumlahTiket" min="1" max="10" value="1" required />
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Pilih Jam Tayang</label>
                            <div>
                                <% for (int i = 0; i < jamTayang.length; i++) { %>
                                    <div class="form-check form-check-inline jam-option">
                                        <input class="form-check-input" type="radio" name="jamTayang"
                                            id="jam<%= i %>" value="<%= jamTayang[i] %>" <%= i == 0 ? "checked" : "" %> />
                                        <label class="form-check-label" for="jam<%= i %>"><%= jamTayang[i] %></label>
                                    </div>
                                <% } %>
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn-book text-white">
                                <i class="fas fa-ticket-alt me-2 text-white"></i> Pesan Tiket
                            </button>
                            <a href="index.jsp" class="btn btn-outline-light mt-2">Batal</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>