(function () {
  // Dark mode toggle
  const toggle = document.querySelector(".theme-toggle");
  if (toggle) {
    toggle.addEventListener("click", function () {
      const current = document.documentElement.getAttribute("data-theme");
      const next = current === "dark" ? "light" : "dark";
      document.documentElement.setAttribute("data-theme", next);
      localStorage.setItem("theme", next);
    });
  }

  // Mobile nav toggle
  const navToggle = document.querySelector(".nav-toggle");
  if (navToggle) {
    navToggle.addEventListener("click", function () {
      const nav = document.querySelector(".site-nav");
      const expanded = this.getAttribute("aria-expanded") === "true";
      this.setAttribute("aria-expanded", String(!expanded));
      nav.classList.toggle("nav-open");
    });

    document.querySelectorAll(".nav-links a").forEach(function (link) {
      link.addEventListener("click", function () {
        document.querySelector(".site-nav").classList.remove("nav-open");
        navToggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  // Lightbox
  var lightbox = document.querySelector(".lightbox");
  var lightboxImg = lightbox ? lightbox.querySelector("img") : null;
  var lightboxPrev = lightbox ? lightbox.querySelector(".lightbox-prev") : null;
  var lightboxNext = lightbox ? lightbox.querySelector(".lightbox-next") : null;
  var currentGroup = [];
  var currentIndex = 0;

  function showPhoto(index) {
    if (index < 0) index = currentGroup.length - 1;
    if (index >= currentGroup.length) index = 0;
    currentIndex = index;
    lightboxImg.src = currentGroup[currentIndex].src;
    lightboxImg.alt = currentGroup[currentIndex].alt;
  }

  if (lightbox && lightboxImg) {
    document.querySelectorAll(".gallery-item img").forEach(function (img) {
      img.addEventListener("click", function () {
        var dest = this.closest(".destination");
        currentGroup = dest
          ? Array.from(dest.querySelectorAll(".gallery-item img"))
          : [this];
        currentIndex = currentGroup.indexOf(this);
        if (currentIndex === -1) currentIndex = 0;
        lightboxImg.src = this.src;
        lightboxImg.alt = this.alt;
        lightbox.classList.add("active");
        document.body.style.overflow = "hidden";
      });
    });

    if (lightboxPrev) {
      lightboxPrev.addEventListener("click", function (e) {
        e.stopPropagation();
        showPhoto(currentIndex - 1);
      });
    }

    if (lightboxNext) {
      lightboxNext.addEventListener("click", function (e) {
        e.stopPropagation();
        showPhoto(currentIndex + 1);
      });
    }

    lightbox.addEventListener("click", function (e) {
      if (
        e.target === lightbox ||
        e.target.classList.contains("lightbox-close")
      ) {
        closeLightbox();
      }
    });

    document.addEventListener("keydown", function (e) {
      if (!lightbox.classList.contains("active")) return;
      if (e.key === "Escape") closeLightbox();
      if (e.key === "ArrowLeft") showPhoto(currentIndex - 1);
      if (e.key === "ArrowRight") showPhoto(currentIndex + 1);
    });

    function closeLightbox() {
      lightbox.classList.remove("active");
      document.body.style.overflow = "";
      lightboxImg.src = "";
      currentGroup = [];
    }
  }
  // Travel TOC collapsible regions
  document.querySelectorAll(".toc-region[data-region]").forEach(function (btn) {
    btn.addEventListener("click", function (e) {
      e.preventDefault();
      var region = this.getAttribute("data-region");
      var dests = document.querySelector(
        '.toc-dests[data-region="' + region + '"]',
      );
      var isOpen = dests && dests.classList.contains("open");

      document.querySelectorAll(".toc-dests.open").forEach(function (d) {
        d.classList.remove("open");
      });
      document.querySelectorAll(".toc-region.active").forEach(function (r) {
        r.classList.remove("active");
      });

      if (!isOpen && dests) {
        dests.classList.add("open");
        this.classList.add("active");
      }

    });
  });

  // Close TOC sub-locations after clicking a destination link
  document.querySelectorAll(".toc-dest").forEach(function (link) {
    link.addEventListener("click", function () {
      document.querySelectorAll(".toc-dests.open").forEach(function (d) {
        d.classList.remove("open");
      });
      document.querySelectorAll(".toc-region.active").forEach(function (r) {
        r.classList.remove("active");
      });
    });
  });

  // Back to top button
  var backToTop = document.querySelector(".back-to-top");
  if (backToTop) {
    window.addEventListener(
      "scroll",
      function () {
        if (window.scrollY > 600) {
          backToTop.classList.add("visible");
        } else {
          backToTop.classList.remove("visible");
        }
      },
      { passive: true },
    );

    backToTop.addEventListener("click", function () {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }
})();
