defmodule Handler do
  @moduledoc """
  Bio Link Website in Elixir
  """
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    # Data Profil (Silakan ubah di sini)
    data = %{
      name: "XdpzQ",
      profile_pic: "https://via.placeholder.com/150", # Ganti dengan URL foto Anda
      whatsapp: "https://wa.me/6285736486023",
      tiktok: "xdpzq0",
      github: "https://github.com/username",
      instagram: "https://instagram.com/username"
    }

    html_content = """
    <!DOCTYPE html>
    <html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= name %> | Bio Link</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            body { font-family: 'Inter', sans-serif; background-color: #F3F4F6; }
            .btn-solid { 
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                width: 100%;
                padding: 12px;
                border-radius: 12px;
                font-weight: 600;
                margin-bottom: 12px;
                color: white;
            }
            .btn-solid:hover { transform: translateY(-2px); opacity: 0.9; }
        </style>
    </head>
    <body class="flex flex-col items-center justify-start min-h-screen p-6">
        
        <!-- Profile Section -->
        <div class="mt-10 mb-8 flex flex-col items-center">
            <img src="<%= profile_pic %>" alt="Profile" class="w-24 h-24 rounded-full border-4 border-white shadow-sm mb-4">
            <h1 class="text-xl font-bold text-gray-800">@<%= name %></h1>
        </div>

        <!-- Links Section -->
        <div class="w-full max-w-md">
            <!-- WhatsApp -->
            <a href="<%= whatsapp %>" target="_blank" class="btn-solid bg-[#25D366]">
                <span>WhatsApp</span>
            </a>

            <!-- Instagram -->
            <a href="<%= instagram %>" target="_blank" class="btn-solid bg-[#E4405F]">
                <span>Instagram</span>
            </a>

            <!-- TikTok -->
            <a href="<%= tiktok %>" target="_blank" class="btn-solid bg-[#000000]">
                <span>TikTok</span>
            </a>

            <!-- GitHub -->
            <a href="<%= github %>" target="_blank" class="btn-solid bg-[#333333]">
                <span>GitHub</span>
            </a>
        </div>

        <footer class="mt-auto pt-10 text-gray-400 text-sm">
            Powered by Elixir & Vercel
        </footer>

    </body>
    </html>
    """

    # Render template dengan data
    rendered_html = EEx.eval_string(html_content, assigns: data)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, rendered_html)
  end
end
