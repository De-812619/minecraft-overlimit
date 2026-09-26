export function esc(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

export function table(headers, rows) {
  const head = headers.map((header) => `<th>${header}</th>`).join("");
  const body = rows
    .map((row) => {
      const cells = row
        .map((cell, index) => `<td data-label="${esc(headers[index])}">${cell}</td>`)
        .join("");
      return `<tr>${cells}</tr>`;
    })
    .join("");
  return `<div class="sheet-wrap"><table class="sheet"><thead><tr>${head}</tr></thead><tbody>${body}</tbody></table></div>`;
}

export function toc(items) {
  return `<nav class="toc" aria-label="このページの見出し">${items
    .map(([id, label]) => `<a href="#${id}" data-anchor="${esc(id)}">${label}</a>`)
    .join("")}</nav>`;
}

export function cards(items) {
  return `<div class="cards">${items
    .map(
      ([href, title, text]) =>
        `<a class="card" href="${href}"><strong>${title}</strong><span>${text}</span></a>`
    )
    .join("")}</div>`;
}

export function note(html, warn = false) {
  return `<aside class="callout${warn ? " warn" : ""}">${html}</aside>`;
}

export function rank(kind) {
  const map = {
    WARNING: "w",
    DANGER: "d",
    CRISIS: "c",
    DISASTER: "x",
  };
  return `<span class="rank ${map[kind] || ""}">${kind}</span>`;
}
