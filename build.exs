# build.exs
# Jalankan script ini dengan perintah: elixir build.exs

data = %{
  name: "Nama Anda",
  profile_pic: "https://api.dicebear.com/7.x/avataaars/svg?seed=Felix", # Avatar keren
  whatsapp: "https://wa.me/628123456789",
  tiktok: "https://tiktok.com/@username",
  github: "https://github.com/username",
  instagram: "https://instagram.com/username"
}

html_template = """
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= name %> | Bio Link</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #FAFAFA; /* Abu-abu sangat muda, bukan gradasi */
        }
        .btn-link {
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 16px;
            border-radius: 16px;
            font-weight: 600;
            margin-bottom: 12px;
            color: white;
            text-decoration: none;
            letter-spacing: 0.5px;
        }
        .btn-link:hover {
            transform: scale(1.02);
            filter: brightness(1.1);
        }
    </style>
</head>
<body class="flex flex-col items-center justify-start min-h-screen p-6 text-[#1A1A1A]">
    
    <!-- Profile -->
    <div class="mt-12 mb-8 flex flex-col items-center">
        <div class="w-24 h-24 rounded-full p-1 bg-white shadow-sm border border-gray-100 mb-4">
            <img src="<%= profile_pic %>" alt="Profile" class="w-full h-full rounded-full object-cover">
        </div>
        <h1 class="text-2xl font-bold tracking-tight">@<%= name %></h1>
        <p class="text-gray-500 mt-1 text-sm font-medium">Digital Creator & Developer</p>
    </div>

    <!-- Buttons -->
    <div class="w-full max-w-sm">
        <a href="<%= whatsapp %>" target="_blank" class="btn-link bg-[#25D366]">
            WhatsApp
        </a>

        <a href="<%= instagram %>" target="_blank" class="btn-link bg-[#E4405F]">
            Instagram
        </a>

        <a href="<%= tiktok %>" target="_blank" class="btn-link bg-[#000000]">
            TikTok
        </a>

        <a href="<%= github %>" target="_blank" class="btn-link bg-[#24292F]">
            GitHub
        </a>
    </div>

    <footer class="mt-auto py-10 text-gray-400 text-xs font-semibold tracking-widest uppercase">
        Built with Elixir
    </footer>

</body>
</html>
"""

# Render HTML menggunakan EEx
rendered_content = EEx.eval_string(html_template, assigns: data)

# Simpan ke file index.html
File.write!("index.html", rendered_content)
IO.puts "✅ Berhasil membuat index.html!"
