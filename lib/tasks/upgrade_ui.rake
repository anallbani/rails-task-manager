namespace :ui do
  desc "Upgrade Rails app to Lemni-style Tailwind UI"
  task upgrade: :environment do
    puts "🛠 Upgrading UI..."

    # Create Tailwind CSS file
    tailwind_css = "app/assets/stylesheets/application.tailwind.css"
    File.write(tailwind_css, "@tailwind base;\n@tailwind components;\n@tailwind utilities;\n")
    puts "✅ Created #{tailwind_css}"

    # Update application.js
    js_path = "app/javascript/application.js"
    File.write(js_path, <<~JS)
      import "motion"
      import "hover3d"
      import "task_toggle"
      import "dark_mode"
      import "task_search"
    JS
    puts "✅ Updated #{js_path}"

    # Add JS files
    {
      "task_toggle.js" => <<~JS,
        document.addEventListener("DOMContentLoaded", () => {
          const checkboxes = document.querySelectorAll(".task-toggle");

          function updateProgressBar() {
            const total = checkboxes.length;
            const completed = [...checkboxes].filter(cb => cb.checked).length;
            const percent = total === 0 ? 0 : Math.round((completed / total) * 100);
            const bar = document.querySelector("#progress-bar");
            const label = document.querySelector("#progress-label");
            if (bar && label) {
              bar.style.width = `${percent}%`;
              label.textContent = `${percent}% Complete`;
            }
          }

          checkboxes.forEach(checkbox => {
            checkbox.addEventListener("change", async () => {
              const taskId = checkbox.dataset.id;
              const response = await fetch(`/tasks/${taskId}/toggle`, {
                method: "PATCH",
                headers: {
                  "Accept": "application/json",
                  "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
                }
              });
              const data = await response.json();
              checkbox.checked = data.completed;
              updateProgressBar();
            });
          });

          updateProgressBar();
        });
      JS
      "hover3d.js" => <<~JS,
        document.addEventListener("DOMContentLoaded", () => {
          const cards = document.querySelectorAll(".task-card");
          cards.forEach((card) => {
            card.addEventListener("mousemove", (e) => {
              const rect = card.getBoundingClientRect();
              const x = e.clientX - rect.left - rect.width / 2;
              const y = e.clientY - rect.top - rect.height / 2;
              const rotateX = -(y / 20);
              const rotateY = x / 20;
              card.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale(1.03)`;
            });
            card.addEventListener("mouseleave", () => {
              card.style.transform = "rotateX(0) rotateY(0) scale(1)";
            });
          });
        });
      JS
      "motion.js" => <<~JS,
        document.addEventListener("DOMContentLoaded", () => {
          const motionBg = document.createElement("div");
          motionBg.className = "absolute inset-0 z-[-1] pointer-events-none animate-pulse bg-gradient-to-tr from-pink-500/10 via-blue-500/10 to-purple-500/10 blur-3xl";
          document.body.appendChild(motionBg);
        });
      JS
    }.each do |filename, content|
      File.write("app/javascript/#{filename}", content)
      puts "✅ Created JS file: #{filename}"
    end

    # Add importmap pins
    importmap_path = "config/importmap.rb"
    import_lines = [
      'pin "motion"',
      'pin "hover3d"',
      'pin "task_toggle"',
      'pin "dark_mode"',
      'pin "task_search"'
    ]
    File.open(importmap_path, "a") { |f| f.puts "\n" + import_lines.join("\n") }
    puts "✅ Updated #{importmap_path}"

    puts "🎉 UI upgrade complete. Run: bin/dev"
  end
end
