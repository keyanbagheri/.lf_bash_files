# Leadfeeder command line shortcuts
# version 1.0.0
# created by Keyan Bagheri
# https://github.com/keyanbagheri

# SETUP VARIABLES AND ALIAS

# [[PLEASE FILL INSIDE THE DOUBLE QUOTES BELOW]]

# ===================
# 1. GITHUB USER NAME

# EXAMPLE: export github_handle="johnsmith"
export github_handle=""


# ======================
# 2. TEXT EDITOR YOU USE

# EXAMPLE: export editor="Sublime Text"
export editor=""


# ======================
# 3. WEB BROWSER YOU USE

# EXAMPLE: export browser="Google Chrome"
export browser=""


# ====================================
# 4. PATH TO LEADFEEDER MAIN DIRECTORY

# EXAMPLE: export lf_dir="~/Code"
export lf_dir=""



# SOURCING ALL FILES (do not edit)
for f in ~/.lf_bash_shortcuts/files/*; do
   . $f
done
