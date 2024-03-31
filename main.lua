-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- declaring variable 
local puzzlePieces = {}
local grid = {}
local gridSize = {
    rows = 4,
    cols = 6
}

local function createGrid(gridContainer)
    local startX = gridContainer.x - gridContainer.width / 2 + 25
    local startY = gridContainer.y - gridContainer.height / 2 + 25
    local cellSize = 60

    for row = 0, gridSize.rows do
        grid[row] = {}
        for col = 0, gridSize.cols do
            local cell = display.newRect(startX + (col - 1) * cellSize, startY + (row - 1) * cellSize, cellSize,
                cellSize)
            cell:setFillColor(1)
            cell.strokeWidth = 1
            cell:setStrokeColor(0)
            grid[row][col] = cell
            gridContainer:insert(cell)
        end
    end
end

local function createGridContainer()
    local gridImagePath = "Images.xcassets\\Resources\\Evento_Pesca_Puzzle_Griglia_Vuota_No_Borders.png"
    local gridContainer = display.newImageRect(gridImagePath, display.contentCenterX, display.contentCenterY, 300, 600)
    gridContainer.x = display.contentCenterX -display.contentCenterX/1.4
    gridContainer.y = display.contentCenterY

    createGrid(gridContainer)
end

local function openPuzzleBox()
    local randomRow = math.random(1, gridSize.rows)
    local randomCol = math.random(1, gridSize.cols)
    local piece = display.newImageRect("puzzle_piece.png", 60, 60)
    piece.x = grid[randomRow][randomCol].x
    piece.y = grid[randomRow][randomCol].y
    table.insert(puzzlePieces, piece)
end

-- Chiamata alla funzione per creare la griglia di gioco
createGridContainer()

-- Evento per aprire la scatola dei puzzle (es. al tocco dello schermo)
Runtime:addEventListener("tap", openPuzzleBox)

