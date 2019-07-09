{ pkgs }:

with pkgs; with emacsPackagesNg;
let emacsWithPackages = (emacsPackagesNgGen emacs).emacsWithPackages;

in emacsWithPackages(epkgs:
  # Actual ELPA packages
  (with epkgs.elpaPackages; [
    company
    pinentry
    rainbow-mode
    undo-tree
  ]) ++

  # MELPA packages:
  (with epkgs.melpaPackages; [
    bash-completion
    circe
    csv-mode
    daemons
    desktop-environment
#   disk-usage
    elfeed
    esh-autosuggest
    expand-region
    exwm
    fish-completion
    flycheck
    geiser
    hackernews
    haskell-mode
    helm
    helm-company
    helm-descbinds
    helm-eww
    helm-flycheck
    helm-ls-git
#   helm-org-contacts
    helm-pass
    helm-slime
    helm-system-packages
    helpful
    hl-todo
    iedit
    js2-mode
    ledger-mode
    lispy
    lispyville
    lua-mode
    magit
    magit-todos
    markdown-mode
    nhexl-mode
    nix-mode
    org
    org-bullets
#   org-contrib
    orgit
    pdf-tools
    pulseaudio-control
    rainbow-delimiters
    slime
    slime-company
    tide
    typescript-mode
#   w3m
    web-mode
    youtube-dl
    ztree
  ])
)
