<%-- 
    Document   : index
    Created on : 16 May 2025, 13.28.17
    Author     : sutantodwiputra
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%ArrayList<HashMap<String, Object>> daftarFilm = new ArrayList<>();

HashMap<String, Object> film1 = new HashMap<>();
film1.put("judul", "The Shawshank Redemption");
film1.put("genre", "Drama");
film1.put("durasi", 142);
film1.put("hargaTiket", 50000);
film1.put("jamTayang", new String[]{"10:00", "14:00", "18:00"});
film1.put("gambar", "https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg");
film1.put("sinopsis", "Kisah persahabatan dan harapan seorang bankir yang dipenjara secara tidak adil di Penjara Shawshank.");
daftarFilm.add(film1);

HashMap<String, Object> film2 = new HashMap<>();
film2.put("judul", "The Godfather");
film2.put("genre", "Crime, Drama");
film2.put("durasi", 175);
film2.put("hargaTiket", 55000);
film2.put("jamTayang", new String[]{"11:00", "15:00", "19:00"});
film2.put("gambar", "https://upload.wikimedia.org/wikipedia/en/a/af/The_Godfather%2C_The_Game.jpg");
film2.put("sinopsis", "Kisah keluarga mafia Corleone dan perjalanan Michael mewarisi bisnis ayahnya.");
daftarFilm.add(film2);

HashMap<String, Object> film3 = new HashMap<>();
film3.put("judul", "The Dark Knight");
film3.put("genre", "Action, Crime, Drama");
film3.put("durasi", 152);
film3.put("hargaTiket", 60000);
film3.put("jamTayang", new String[]{"12:00", "16:00", "20:00"});
film3.put("gambar", "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg");
film3.put("sinopsis", "Batman menghadapi Joker, penjahat psikopat yang ingin menciptakan kekacauan di Gotham.");
daftarFilm.add(film3);

HashMap<String, Object> film4 = new HashMap<>();
film4.put("judul", "Pulp Fiction");
film4.put("genre", "Crime, Drama");
film4.put("durasi", 154);
film4.put("hargaTiket", 52000);
film4.put("jamTayang", new String[]{"13:00", "17:00", "21:00"});
film4.put("gambar", "https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg");
film4.put("sinopsis", "Beberapa cerita kriminal terhubung dengan gaya unik Quentin Tarantino.");
daftarFilm.add(film4);

HashMap<String, Object> film5 = new HashMap<>();
film5.put("judul", "Schindler's List");
film5.put("genre", "Biography, Drama, History");
film5.put("durasi", 195);
film5.put("hargaTiket", 48000);
film5.put("jamTayang", new String[]{"10:30", "14:30", "18:30"});
film5.put("gambar", "https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg");
film5.put("sinopsis", "Kisah nyata Oskar Schindler yang menyelamatkan ribuan Yahudi dari Holocaust.");
daftarFilm.add(film5);

HashMap<String, Object> film6 = new HashMap<>();
film6.put("judul", "Catch Me If You Can");
film6.put("genre", "Biography, Crime, Drama");
film6.put("durasi", 141);
film6.put("hargaTiket", 53000);
film6.put("jamTayang", new String[]{"11:30", "15:30", "19:30"});
film6.put("gambar", "https://upload.wikimedia.org/wikipedia/en/4/4d/Catch_Me_If_You_Can_2002_movie.jpg");
film6.put("sinopsis", "Kisah nyata Frank Abagnale Jr., penipu ulung yang memalsukan cek dan identitas.");
daftarFilm.add(film6);

HashMap<String, Object> film7 = new HashMap<>();
film7.put("judul", "Forrest Gump");
film7.put("genre", "Drama, Romance");
film7.put("durasi", 142);
film7.put("hargaTiket", 56000);
film7.put("jamTayang", new String[]{"12:30", "16:30", "20:30"});
film7.put("gambar", "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg");
film7.put("sinopsis", "Pria dengan IQ rendah menjalani hidup penuh petualangan dan mengubah sejarah Amerika.");
daftarFilm.add(film7);

HashMap<String, Object> film8 = new HashMap<>();
film8.put("judul", "Fight Club");
film8.put("genre", "Drama, Thriller");
film8.put("durasi", 139);
film8.put("hargaTiket", 58000);
film8.put("jamTayang", new String[]{"19:30", "22:30"}); // Tayang malam untuk vibe yang pas
film8.put("gambar", "https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg");
film8.put("sinopsis", "Seorang pria insomnia membentuk klub pertarungan bawah tanah yang berkembang menjadi sesuatu yang tak terduga.");
daftarFilm.add(film8);
// Simpan ke session
session.setAttribute("daftarFilm", daftarFilm);
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NontonLagi - Home of your favourites and more.</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
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
        }
        
        .navbar {
            padding: 1rem 2rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            justify-content: center;
            align-items: center;
        
        }
        
        .navbar-brand {
            font-weight: bold;
            font-size: 2rem;
            color: white;
            
        }
        
        .navbar-brand span {
            color: var(--accent-color);
        }
        
        .hero-section {
            background: linear-gradient(to bottom, #0c111b, var(--primary-color));
            padding: 6rem 0;
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        
        .hero-section p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 2rem;
            opacity: 0.8;
        }
        
        .container-fluid {
            padding: 0 5%;
        }
        
        .section-title {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            margin-top: 2rem;
            padding-left: 0.5rem;
            border-left: 4px solid var(--accent-color);
            color: var(--text-color);
        }
        
        .film-card {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            background-color: var(--secondary-color);
            transition: all 0.3s ease;
            border: none;
            height: 100%;
        }
        
        .film-card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
            background-color: var(--card-hover);
        }
        
        .card-img-container {
            position: relative;
            overflow: hidden;
            height: 400px;
            width: 100%;
        }
        
        .card-img-top {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .film-card:hover .card-img-top {
            transform: scale(1.05);
        }
        
        .film-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 60%);
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 1.5rem;
            opacity: 0;
            transition: opacity 0.3s;
        }
        
        .film-card:hover .film-overlay {
            opacity: 1;
        }
        
        .film-overlay-title {
            font-size: 1.4rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        
        .film-overlay-genre {
            font-size: 0.9rem;
            opacity: 0.8;
            margin-bottom: 1rem;
        }
        
        .film-info {
            padding: 1.5rem;
        }
        
        .film-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: white;
        }
        
        .film-genre, .film-duration, .film-price {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 0.5rem;
        }
        
        .film-times {
            display: flex;
            flex-wrap: wrap;
            margin-top: 1rem;
            margin-bottom: 1rem;
        }
        
        .film-time {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
        }
        
        .btn-book {
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 5px;
            padding: 0.6rem 1.2rem;
            font-weight: bold;
            transition: all 0.3s;
        }
        
        .btn-book:hover {
            background-color: #005bb8;
            transform: translateY(-2px);
        }
        
        .btn-more-info {
            color: var(--accent-color);
            background: none;
            border: 1px solid var(--accent-color);
            margin-right: 0.5rem;
        }
        
        .btn-more-info:hover {
            background-color: rgba(0, 114, 210, 0.1);
            color: var(--accent-color);
        }
        
        .footer {
            padding: 2rem 0;
            margin-top: 3rem;
        }
        
        .modal-content {
            background-color: var(--secondary-color);
            color: var(--text-color);
            border-radius: 12px;
        }
        
        .modal-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .modal-footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .modal-title {
            font-weight: bold;
        }
        
        .logo-gradient {
            background: linear-gradient(90deg, #0072D2, #00A1FF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .hero-section {
                padding: 4rem 0;
            }
            
            .hero-section h1 {
                font-size: 2.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .card-img-container {
                height: 250px;
            }
            
            .hero-section {
                padding: 3rem 0;
            }
            
            .hero-section h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

<section class="position-relative text-white" style="height: 100vh; background-image: url('https://wallpapers.com/images/hd/horror-movie-collage-2560-x-1600-7rsxip7198v2wynq.jpg'); background-size: cover; background-position: center;">
  <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(to top, rgba(0,0,0,1), rgba(0,0,0,0.7));"></div>

  <div class="container h-100 position-relative d-flex flex-column justify-content-center align-items-center text-center">
    <div class="mb-4">
      <h1 class="display-1 fw-bold">
        Nonton<span style="font-style: italic; color: #008080;">Lagi</span>
      </h1>
    </div>
    
    <h2 class="display-6 mb-3">Home of your favourites and more.</h2>
    <p class="lead mb-5" style="max-width: 500px;">Nikmati film-film terbaik dan terpopuler dengan kualitas terbaik hanya di NontonLagi.</p>
    
    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
      <button type="button" class="btn btn-lg px-4 me-sm-3" style="background-color: #008080; color: white;">Subscribe Now</button>
      <button type="button" class="btn btn-outline-light btn-lg px-4" onclick="scrollToFilms()">Lihat Film</button>
    </div>
  </div>
</section>

    <div class="container-fluid">
        <h2 class="section-title">Daftar Film</h2>
        <div class="row">
            <% for (int i = 0; i < daftarFilm.size(); i++) { 
                HashMap<String, Object> film = daftarFilm.get(i);
            %>
                <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                    <div class="film-card">
                        <div class="card-img-container">
                            <img src="<%= film.get("gambar") %>" class="card-img-top" alt="<%= film.get("judul") %>">
                            <div class="film-overlay">
                                <div class="film-overlay-title"><%= film.get("judul") %></div>
                                <div class="film-overlay-genre"><%= film.get("genre") %></div>
                            </div>
                        </div>
                        <div class="film-info">
                            <div class="film-title"><%= film.get("judul") %></div>
                            <div class="film-genre">Genre: <%= film.get("genre") %></div>
                            <div class="film-duration">Durasi: <%= film.get("durasi") %> menit</div>
                            <div class="film-price">Harga Tiket: Rp<%= film.get("hargaTiket") %></div>
                            <div class="film-times">
                                <% 
                                    String[] jam = (String[]) film.get("jamTayang");
                                    for (String j : jam) {
                                %>
                                    <div class="film-time"><%= j %></div>
                                <% } %>
                            </div>

                            <button type="button" class="btn btn-more-info" data-bs-toggle="modal" data-bs-target="#filmModal<%= i %>">
                                Detail
                            </button>
                            <button class="btn btn-book" onclick="document.location.href='formPesan.jsp?filmId=<%= i %>'">Pesan Tiket</button>

                        </div>
                    </div>
                </div>

                
                    <div class="modal fade" id="filmModal<%= i %>" tabindex="-1" aria-labelledby="filmModalLabel<%= i %>" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" style="max-width: 500px;">
                        <div class="modal-content" style="background-color: var(--secondary-color); border-radius: 15px; overflow: hidden;">
                          <div class="modal-header border-0">
                            <h5 class="modal-title fs-4 fw-bold" id="filmModalLabel<%= i %>"><%= film.get("judul") %></h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>

                          <div class="modal-body p-0">
                            <div class="text-center bg-dark">
                              <img src="<%= film.get("gambar") %>" alt="<%= film.get("judul") %>" class="img-fluid" style="max-height: 500px; object-fit: cover;" />
                            </div>

                            <div class="p-4">
                              <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="badge bg-dark text-white px-3 py-2"><%= film.get("genre") %></span>
                                <span class="badge bg-dark text-white px-3 py-2"><%= film.get("durasi") %> menit</span>
                              </div>

                              <div class="mb-4">
                                <h6 class="text-light opacity-75 mb-2">Sinopsis</h6>
                                <p class="mb-4" style="line-height: 1.6;"><%= film.get("sinopsis") %></p>
                              </div>

                              <div class="mb-4">
                                <h6 class="text-light opacity-75 mb-2">Harga Tiket</h6>
                                <p class="fs-5 fw-bold">Rp<%= film.get("hargaTiket") %></p>
                              </div>

                              <div class="mb-4">
                                <h6 class="text-light opacity-75 mb-2">Jam Tayang</h6>
                                <div class="d-flex flex-wrap gap-2">
                                  <% 
                                    String[] jamModal = (String[]) film.get("jamTayang");
                                    for (String jamTayang : jamModal) {
                                  %>
                                    <span class="badge" style="background-color: var(--accent-color);"><%= jamTayang %></span>
                                  <% } %>
                                </div>
                              </div>

                              <div class="d-grid">
                                <button class="btn btn-book" style="background-color: var(--accent-color); color: white;" onclick="document.location.href='formPesan.jsp?filmId=<%= i %>'">
                                  <i class="fas fa-ticket-alt me-2"></i> Pesan Tiket
                                </button>
                                <button type="button" class="btn btn-outline-light mt-2" data-bs-dismiss="modal">Tutup</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
            <% } %>
        </div>
    </div>

    <footer class="footer text-center">
        <p>&copy; 2025 NontonLagi. Semua Hak Dilindungi.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function scrollToFilms() {
          const filmsSection = document.querySelector('.section-title');
          if (filmsSection) {
            filmsSection.scrollIntoView({ behavior: 'smooth' });
          }
        }
    </script>
</body>
</html>