document.addEventListener("DOMContentLoaded", () => {
  const motionBg = document.createElement("div");
  motionBg.className = "absolute inset-0 z-[-1] pointer-events-none animate-pulse bg-gradient-to-tr from-pink-500/10 via-blue-500/10 to-purple-500/10 blur-3xl";
  document.body.appendChild(motionBg);
});
