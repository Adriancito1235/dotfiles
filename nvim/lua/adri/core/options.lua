vim.cmd("let g:netrw_liststyle = 3")    -- Cambia el estilo del explorador a estilo de arbol

local opt = vim.opt   -- Para no tener que ir poniendo todo el rato vim.opt

-- Line numbers
opt.relativenumber = true   -- Líneas de números relativas	
opt.number = true   -- Mostrar número de la linea en la que estoy

-- Tab spacing
opt.tabstop = 2   -- Ahora el tabulador añade dos espacios por tabulación
opt.shiftwidth = 2    -- El anho de indentado es de 2 espacios
opt.expandtab = true    -- Expande tabulaciones en espacios
opt.autoindent = true   -- Copia la indentación de la línea actual a la siguiente línea

-- Wrapping
opt.wrap = false    -- Deshabilitar wrap arround

-- Search sensitivity
opt.ignorecase = true   -- Ignorar mayusculas en la busqueda cuando escribo todo en minuscula                      
opt.smartcase = true    -- Cuando hay alguna mayuscula en mi busqueda, respetar las mayuscula

-- Terminal colors
opt.termguicolors = true    -- Que el terminal pueda mostrar los colores correctamente
opt.background = "dark"   -- Que el tema de colores sea dark si tiene opción de ser light
opt.signcolumn = "yes"    -- No tengo ni idea de que es --TODO

-- Backspace
opt.backspace = "indent,eol,start"    -- Que la tecla de borrar funcione correctamente en indentaciones, finales de linia y el inicio de cada linea

-- Clipboard
opt.clipboard:append("unnamedplus")    -- Usar clipbload del sistema para copiar y pegar

-- Splits
opt.splitright = true   -- Cuando haga un vertical split, se va a dividir por la derecha
opt.splitbelow = true    -- Cuando haga un horizontal split se va a dividir por abajo
