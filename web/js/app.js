import { bloodMoon, bloodWorld, clamp, events, overflow, raise } from "./pages/events.js";
import { enchants } from "./pages/enchants.js";
import { install } from "./pages/install.js";
import { craft, items, trims, unlimited } from "./pages/items.js";
import { overview } from "./pages/overview.js";

const pages = [
  overview,
  install,
  events,
  bloodMoon,
  bloodWorld,
  overflow,
  raise,
  clamp,
  items,
  craft,
  unlimited,
  trims,
  enchants,
];

const home = {
  path: "/",
  title: "Over Limit Wiki",
  html: `
    <p class="kicker">Minecraft Java 26.2</p>
    <h1>Over Limit Wiki</h1>
    <p class="lead">構造物のチェストに上限を超えた装備が入り、敵の一部が段階強化されます。夜、門、ネザー、エンドでは、勝つほど次が厳しくなるイベントが回ります。はじめての方は <a href="index.html">紹介ページ</a> からどうぞ。</p>
    <div class="cards">
      <a class="card" href="#/overview"><strong><img class="px" src="img/vanilla/book.png" alt="">概要</strong><span>Mod の狙い、強化Mob、難易度の4層。</span></a>
      <a class="card" href="#/install"><strong><img class="px" src="img/vanilla/oak_door.png" alt="">導入</strong><span>Fabric JAR、マルチのリソースパック、DnT。</span></a>
      <a class="card" href="#/events"><strong><img class="px" src="img/vanilla/clock.png" alt="">イベント</strong><span>脅威指数、世界圧、消耗、五つの戦場。</span></a>
      <a class="card" href="#/items"><strong><img class="px" src="img/vanilla/chest.png" alt="">アイテム</strong><span>チェスト、クラフト、UNLIMITED、装飾。</span></a>
      <a class="card" href="#/enchants"><strong><img class="px" src="img/vanilla/enchanted_book.png" alt="">エンチャント</strong><span>上限超えと、装備に付く固有効果。</span></a>
    </div>
    <h2>最初に覚えること</h2>
    <ul>
      <li>チェストの追加は、まだ生成されていない構造物だけに入ります。</li>
      <li>装備と本には消滅の呪いが付きます。金床にかけると、上限超えのバニラエンチャントは通常の上限に戻ります。</li>
      <li>静寂のトーテムは発生中のイベントを1つ止めますが、報酬は出ず、世界圧が上がります。</li>
      <li>聖王のトーテムは世界圧だけを0に戻します。イベントは止まりません。</li>
    </ul>
    <p class="footer-note">この wiki は静的なページです。サーバーのドキュメントルートを <code>web/</code> にして配信できます。</p>
  `,
};

const all = [home, ...pages];
const navEl = document.querySelector("#nav");
const mainEl = document.querySelector("#content");
const menuBtn = document.querySelector("#menu-btn");
const backdrop = document.querySelector("#backdrop");
const searchForm = document.querySelector("#search-form");
const searchInput = document.querySelector("#search-input");
const searchPanel = document.querySelector("#search-panel");

const index = all.map((page) => ({
  page,
  text: strip(page.html),
}));

function strip(html) {
  const node = document.createElement("div");
  node.innerHTML = html;
  return (node.textContent || "").replace(/\s+/g, " ").trim();
}

const ICONS = {
  "/": "img/vanilla/grass.png",
  "/overview": "img/vanilla/book.png",
  "/install": "img/vanilla/oak_door.png",
  "/events": "img/vanilla/clock.png",
  "/events/blood-moon": "img/vanilla/moon.png",
  "/events/blood-world": "img/vanilla/crying_obsidian.png",
  "/events/overflow": "img/vanilla/nether_portal.png",
  "/events/raise": "img/vanilla/blaze_rod.png",
  "/events/clamp": "img/vanilla/ender_eye.png",
  "/items": "img/vanilla/chest.png",
  "/items/craft": "img/vanilla/crafting_table.png",
  "/items/unlimited": "img/item/unlimited_sword.png",
  "/items/trims": "img/vanilla/smithing_table.png",
  "/enchants": "img/vanilla/enchanted_book.png",
};

function iconFor(path) {
  const src = ICONS[path];
  return src ? `<img class="px" src="${src}" alt="">` : "";
}

function renderNav(activePath) {
  const homeLink = `<a class="${activePath === "/" ? "active" : ""}" href="#/">${iconFor("/")}トップ</a>`;
  const groups = [];
  for (const page of pages) {
    let group = groups.find((item) => item.name === page.group);
    if (!group) {
      group = { name: page.group, pages: [] };
      groups.push(group);
    }
    group.pages.push(page);
  }
  navEl.innerHTML = groups
    .map((group) => {
      const label = `<div class="nav-label">${group.name}</div>`;
      const links = group.pages
        .map((page) => {
          const active = page.path === activePath ? " active" : "";
          return `<a class="${active.trim()}" href="#${page.path}">${iconFor(page.path)}${page.nav}</a>`;
        })
        .join("");
      return label + links;
    })
    .join("");
  navEl.innerHTML = homeLink + navEl.innerHTML;
}

function match(path) {
  const ordered = [...all].sort((a, b) => b.path.length - a.path.length);
  for (const page of ordered) {
    if (path === page.path) return { page, anchor: "" };
    if (page.path !== "/" && path.startsWith(`${page.path}/`)) {
      return { page, anchor: decodeURIComponent(path.slice(page.path.length + 1)) };
    }
  }
  return null;
}

function currentPath() {
  const raw = location.hash.replace(/^#/, "") || "/";
  const path = raw.startsWith("/") ? raw : `/${raw}`;
  return path.split("?")[0];
}

function esc(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function render() {
  hideSearch();
  const path = currentPath();
  const found = match(path);
  const page = found ? found.page : null;
  const base = page ? page.path : "/";
  renderNav(base);
  if (!page) {
    document.title = "見つかりません · Over Limit Wiki";
    mainEl.innerHTML = `<article class="page"><h1>ページがありません</h1><p><a href="#/">トップへ戻る</a></p></article>`;
    return;
  }
  document.title = page.path === "/" ? "Over Limit Wiki" : `${page.title} · Over Limit Wiki`;
  mainEl.innerHTML = `<article class="page">${page.html}</article>`;
  const heading = mainEl.querySelector("h1");
  if (heading && page.path !== "/") {
    heading.insertAdjacentHTML("afterbegin", iconFor(page.path));
  }
  if (found.anchor) {
    const target = document.getElementById(found.anchor);
    if (target) target.scrollIntoView();
  } else {
    window.scrollTo(0, 0);
  }
}

function closeNav() {
  navEl.classList.remove("open");
  menuBtn.setAttribute("aria-expanded", "false");
  backdrop.hidden = true;
}

function openNav() {
  navEl.classList.add("open");
  menuBtn.setAttribute("aria-expanded", "true");
  backdrop.hidden = false;
}

menuBtn.addEventListener("click", () => {
  if (navEl.classList.contains("open")) closeNav();
  else openNav();
});
backdrop.addEventListener("click", closeNav);

document.addEventListener("click", (event) => {
  const link = event.target.closest("a");
  if (!link) return;
  const anchor = link.dataset.anchor;
  if (anchor) {
    event.preventDefault();
    const base = match(currentPath())?.page.path || "/";
    const next = `${base}/${anchor}`;
    if (currentPath() === next) {
      document.getElementById(anchor)?.scrollIntoView();
    } else {
      location.hash = next;
    }
    return;
  }
  if ((link.getAttribute("href") || "").startsWith("#/")) closeNav();
});

function hideSearch() {
  searchPanel.hidden = true;
  searchPanel.innerHTML = "";
}

function showSearch(query) {
  const q = query.trim().toLowerCase();
  if (!q) {
    hideSearch();
    return;
  }
  const hits = index
    .map(({ page, text }) => {
      const hay = `${page.title} ${text}`.toLowerCase();
      const at = hay.indexOf(q);
      if (at < 0) return null;
      const start = Math.max(0, at - 28);
      const snippet = text.slice(start, start + 80);
      return { page, snippet };
    })
    .filter(Boolean)
    .slice(0, 8);
  searchPanel.hidden = false;
  if (!hits.length) {
    searchPanel.innerHTML = `<p class="search-empty">一致するページがありません</p>`;
    return;
  }
  searchPanel.innerHTML = hits
    .map(
      ({ page, snippet }) =>
        `<a class="search-hit" href="#${page.path}"><strong>${esc(page.title)}</strong><span>${esc(snippet)}</span></a>`
    )
    .join("");
}

searchInput.addEventListener("input", () => showSearch(searchInput.value));
searchForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const first = searchPanel.querySelector("a");
  if (first) first.click();
});
document.addEventListener("click", (event) => {
  if (!searchForm.contains(event.target)) hideSearch();
});
document.addEventListener("keydown", (event) => {
  if (event.key === "/" && document.activeElement !== searchInput) {
    event.preventDefault();
    searchInput.focus();
  }
  if (event.key === "Escape") {
    hideSearch();
    closeNav();
  }
});

window.addEventListener("hashchange", render);
if (!location.hash) location.hash = "/";
render();
