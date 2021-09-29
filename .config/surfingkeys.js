
// ---- Unmaps -----
const unmaps = [
  "sb", "sw", "ob",
  "ow", "cp", ";cp",
  ";ap", "spa", "spb",
  "spd", "sps", "spc",
  "spi", "sfr", "zQ",
  "zz", "zR", "ab",
  "Q", "q", "ag",
  "af", ";s", "yp",
]

unmaps.forEach((u) => {
  unmap(u)
})

// Emoji
iunmap(":");

// Proxy Stuff
unmap('spa');
unmap('spb');
unmap('spc');
unmap('spd');
unmap('sps');
unmap('cp');
unmap(';cp');
unmap(';ap');

// Misc
unmap(';t');
unmap('si');
unmap('ga');
unmap('gc');
unmap('gn');
unmap('gr');
unmap('ob');
unmap('og');
unmap('od');
unmap('oy');

const rmSearchAliases =
  {
    s: ["g", "d", "b",
      "w", "s", "h"],
  }

Object.keys(rmSearchAliases).forEach((k) => {
  rmSearchAliases[k].forEach((v) => {
    removeSearchAliasX(v, k)
  })
})

// ---- Settings ----//
settings.hintAlign = "left"
settings.omnibarSuggestionTimeout = 500
settings.richHintsForKeystroke = 1
settings.scrollStepSize = 140;
settings.newTabPosition = "right";
settings.modeAfterYank = 'Normal';

// ---- Maps ----//
// Left-hand aliases
// Movement
map("w", "k")
map("s", "j")

// Tab Navigation
map("K", "E")
map("J", "R")

// History
map("H", "S")
map("L", "D")

// follow in a new tab
map('F', 'C');

// Next/Prev Page
map(']', ']]');
map('[', '[[');

// Scroll Page Down/Up
mapkey('<Ctrl-d>', '#9Forward half page', function() { Normal.feedkeys('3j'); });
mapkey('<Ctrl-u>', '#9Back half page', function() { Normal.feedkeys('3k'); });
mapkey('<Ctrl-Space>', '#9Page Up', function() { Normal.feedkeys('5k'); });

// Misc
map('P', 'cc');
map('gf', 'w');
map('`', '\'');
map('o', 'go');


// ---- Functions ----//

const vimEditURL = () => Front
  .showEditor(window.location.href, (data) => {
    window.location.href = data
  }, "url")

const domainDossier = "http://centralops.net/co/DomainDossier.aspx"

const whois = () =>
  tabOpenLink(`${domainDossier}?dom_whois=true&addr=${window.location.hostname}`)

const dns = () =>
  tabOpenLink(`${domainDossier}?dom_dns=true&addr=${window.location.hostname}`)

const dnsVerbose = () =>
  tabOpenLink(`${domainDossier}?dom_whois=true&dom_dns=true&traceroute=true&net_whois=true&svc_scan=true&addr=${window.location.hostname}`)

const togglePdfViewer = () =>
  chrome.storage.local.get("noPdfViewer", (resp) => {
    if (!resp.noPdfViewer) {
      chrome.storage.local.set({ noPdfViewer: 1 }, () => {
        Front.showBanner("PDF viewer disabled.")
      })
    } else {
      chrome.storage.local.remove("noPdfViewer", () => {
        Front.showBanner("PDF viewer enabled.")
      })
    }
  })

const getURLPath = (count, domain) => {
  let path = window.location.pathname.slice(1)
  if (count) {
    path = path.split("/").slice(0, count).join("/")
  }
  if (domain) {
    path = `${window.location.hostname}/${path}`
  }
  return path
}

const copyURLPath = (count, domain) => () => Clipboard.write(getURLPath(count, domain))

const editSettings = () => tabOpenLink("/pages/options.html")

const Hint = (selector, action = Hints.dispatchMouseClick) => () => Hints.create(selector, action)

// ---- Mapkeys ----//
const ri = { repeatIgnore: true }

// --- Global mappings ---//
//  0: Help
//  1: Mouse Click
//  2: Scroll Page / Element
//  3: Tabs
//  4: Page Navigation
mapkey("gi", "#4Edit current URL with vim editor", vimEditURL, ri)
mapkey("gI", "#4View image in new tab", Hint("img", i => tabOpenLink(i.src)), ri)
//  5: Sessions
//  6: Search selected with
//  7: Clipboard
mapkey("yp", "#7Copy URL path of current page", copyURLPath(), ri)
mapkey("yI", "#7Copy Image URL", Hint("img", i => Clipboard.write(i.src)), ri)
//  8: Omnibar
//  9: Visual Mode
// 10: vim-like marks
// 11: Settings
mapkey(";se", "#11Edit Settings", editSettings, ri)
// 12: Chrome URLs
mapkey("gS", "#12Open Chrome settings", () => tabOpenLink("chrome://settings/"))
// 13: Proxy
// 14: Misc
mapkey("=w", "#14Lookup whois information for domain", whois, ri)
mapkey("=d", "#14Lookup dns information for domain", dns, ri)
mapkey("=D", "#14Lookup all information for domain", dnsVerbose, ri)
mapkey(";pd", "#14Toggle PDF viewer from SurfingKeys", togglePdfViewer, ri)
// 15: Insert Mode

// ---- Aliases ----//
map(",b", "T")


// ---- Theme ----//

// Nord
Hints.style('border: solid 2px #4C566A; color:#A3BE8C; background: initial; background-color: #3B4252;');
Hints.style("border: solid 2px #4C566A !important; padding: 1px !important; color: #E5E9F0 !important; background: #3B4252 !important;", "text");
Visual.style('marks', 'background-color: #A3BE8C99;');
Visual.style('cursor', 'background-color: #88C0D0;');

settings.theme = `
/* Edit these variables for easy theme making */
:root {
  /* Font */
  --font: 'Source Code Pro', Ubuntu, sans;
  --font-size: 12;
  --font-weight: bold;

  /* -------------------- */
  /* --      NORD      -- */
  /* -------------------- */
  --fg: #E5E9F0;
  --bg: #3B4252;
  --bg-dark: #2E3440;
  --border: #4C566A;
  --main-fg: #88C0D0;
  --accent-fg: #A3BE8C;
  --info-fg: #5E81AC;
  --select: #4C566A;

  /* Unused Alternate Colors */
  /* --orange: #D08770; */
  /* --red: #BF616A; */
  /* --yellow: #EBCB8B; */

}

/* ---------- Generic ---------- */
.sk_theme {
background: var(--bg);
color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}

.sk_theme tbody {
  color: var(--fg);
}

.sk_theme input {
  color: var(--fg);
}

/* Hints */
#sk_hints .begin {
  color: var(--accent-fg) !important;
}

#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
}

#sk_tabs .sk_tab_title {
  color: var(--fg);
}

#sk_tabs .sk_tab_url {
  color: var(--main-fg);
}

#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}

.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}

/* ---------- Omnibar ---------- */
/* Uncomment this and use settings.omnibarPosition = 'bottom' for Pentadactyl/Tridactyl style bottom bar */
/* .sk_theme#sk_omnibar {
  width: 100%;
  left: 0;
} */

.sk_theme .title {
  color: var(--accent-fg);
}

.sk_theme .url {
  color: var(--main-fg);
}

.sk_theme .annotation {
  color: var(--accent-fg);
}

.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}

.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}

.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}

.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}

.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}

.sk_theme .separator {
  color: var(--accent-fg);
}

/* ---------- Popup Notification Banner ---------- */
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}

/* ---------- Popup Keys ---------- */
#sk_keystroke {
  background-color: var(--bg);
}

.sk_theme kbd .candidates {
  color: var(--info-fg);
}

.sk_theme span.annotation {
  color: var(--accent-fg);
}

/* ---------- Popup Translation Bubble ---------- */
#sk_bubble {
  background-color: var(--bg) !important;
  color: var(--fg) !important;
  border-color: var(--border) !important;
}

#sk_bubble * {
  color: var(--fg) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(1) {
  border-top-color: var(--border) !important;
  border-bottom-color: var(--border) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(2) {
  border-top-color: var(--bg) !important;
  border-bottom-color: var(--bg) !important;
}

/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  border-color: var(--border);
}

.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}

.sk_theme .feature_name span {
  color: var(--main-fg);
}

/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}

.ace_dialog-bottom {
  border-top: 1px solid var(--bg) !important;
}

.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}

.ace-chrome {
  color: var(--fg) !important;
}

.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}

.ace_cursor {
  color: var(--fg) !important;
}

.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.7 !important;
}

.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}

.ace_editor,
.ace_dialog span,
.ace_dialog input {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}
`;
