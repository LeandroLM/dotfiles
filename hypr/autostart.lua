-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- fcitx5 input method (Brazilian Portuguese accents)
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
o.launch_on_start("fcitx5 -d --replace")
