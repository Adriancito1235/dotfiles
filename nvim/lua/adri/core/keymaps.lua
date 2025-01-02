--Establecer la tecla leader como espacio
vim.g.mapleader = " "		

--Esto es para evitar tener que ir poniendo todo el rato vim.keymap
keymap = vim.keymap 

-- Abrir el explorador de archivos con la oción ff
--keymap.set('n', '<Leader>ff', ':Ex<CR>', {desc = 'Open file explorer - Find File'})

-- Borrar la busqueda resaltada con la opción nh 
keymap.set('n', '<Leader>nh', ':nohl<CR>', {desc = 'Borrar la busqueda destacada hecha previamente - No Highlight'})

-- Splits
keymap.set('n', '<Leader>sv', "<C-w>v", {desc = 'Split window vertically'})
keymap.set('n', '<Leader>sh', "<C-w>s", {desc = 'Split window horizontally'})
keymap.set('n', '<Leader>se', "<C-w>=", {desc = 'Split window make them equal size'})
keymap.set('n', '<Leader>sx', "<cmd>close<CR>", {desc = 'Split window close'})

-- Change movement keys
keymap.set('n', 'j', 'h', {desc = 'Move to the left'})
keymap.set('n', 'k', 'j', {desc = 'Move up'})
keymap.set('n', 'l', 'k', {desc = 'Move down'})
keymap.set('n', 'ñ', 'l', {desc = 'Move to the right'})


