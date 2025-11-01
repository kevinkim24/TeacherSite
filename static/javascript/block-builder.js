// Configuration
const FLASK_URL = '/plt-blocks/execute_plot'; // For local dev
//const FLASK_URL = 'http://mxork.com/plt-blocks/execute_plot'
const colorOptions = ['red', 'blue', 'green', 'purple', 'orange', 'yellow', 'custom'];

// State
let blocks = [];
let draggedBlock = null;
let draggedListRef = null;
let blockCounters = {};
let isExecuting = false;

// Block Type Definitions
const blockTypes = [
    { 
        id: 'figure', 
        label: 'Create Figure', 
        color: 'bg-blue-500',
        params: [
            { name: 'width', default: '8', type: 'text' },
            { name: 'height', default: '6', type: 'text' },
            { name: 'nrows', default: '1', type: 'dropdown', options: ['1', '2', '3', '4'] },
            { name: 'ncols', default: '1', type: 'dropdown', options: ['1', '2', '3', '4'] },
            { name: 'dpi', default: '100', type: 'dropdown', options: ['72', '100', '150', '200', '300'] }
        ],
        hasGrid: true
    },
    { 
        id: 'list', 
        label: 'List', 
        color: 'bg-indigo-500',
        params: [
            { name: 'name', default: 'myList', type: 'text' },
            { name: 'values', default: '[1,2,3,4,5]', type: 'text' }
        ],
        isTopLevel: true
    },
    { 
        id: 'plot', 
        label: 'Line Plot', 
        color: 'bg-green-500',
        params: [
            { name: 'label', default: 'Line 1', type: 'text' },
            { name: 'color', default: 'blue', type: 'color' },
            { name: 'alpha', default: '1.0', type: 'text' },
            { name: 'legend', default: false, type: 'toggle' },
            { name: 'grid', default: false, type: 'toggle' }
        ],
        hasSlots: true,
        hasDataSlots: true
    },
    { 
        id: 'scatter', 
        label: 'Scatter Plot', 
        color: 'bg-purple-500',
        params: [
            { name: 'label', default: 'Points', type: 'text' },
            { name: 'color', default: 'purple', type: 'color' },
            { name: 'alpha', default: '1.0', type: 'text' },
            { name: 'legend', default: false, type: 'toggle' },
            { name: 'grid', default: false, type: 'toggle' }
        ],
        hasSlots: true,
        hasDataSlots: true
    },
    { 
        id: 'bar', 
        label: 'Bar Chart', 
        color: 'bg-orange-500',
        params: [
            { name: 'label', default: 'Bars', type: 'text' },
            { name: 'color', default: 'orange', type: 'color' },
            { name: 'alpha', default: '1.0', type: 'text' },
            { name: 'legend', default: false, type: 'toggle' },
            { name: 'grid', default: false, type: 'toggle' }
        ],
        hasSlots: true,
        hasDataSlots: true
    },
    { 
        id: 'histogram', 
        label: 'Histogram', 
        color: 'bg-teal-500',
        params: [
            { name: 'label', default: 'Hist', type: 'text' },
            { name: 'bins', default: '10', type: 'text' },
            { name: 'color', default: 'blue', type: 'color' },
            { name: 'alpha', default: '0.7', type: 'text' },
            { name: 'legend', default: false, type: 'toggle' },
            { name: 'grid', default: false, type: 'toggle' }
        ],
        hasSlots: true,
        hasDataSlots: true,
        singleData: true
    },
    { 
        id: 'title', 
        label: 'Set Title', 
        color: 'bg-pink-500',
        params: [
            { name: 'text', default: 'My Chart', type: 'text' }
        ],
        isSmall: true
    },
    { 
        id: 'xlabel', 
        label: 'X-Axis Label', 
        color: 'bg-cyan-500',
        params: [
            { name: 'text', default: 'X Axis', type: 'text' }
        ],
        isSmall: true
    },
    { 
        id: 'ylabel', 
        label: 'Y-Axis Label', 
        color: 'bg-cyan-500',
        params: [
            { name: 'text', default: 'Y Axis', type: 'text' }
        ],
        isSmall: true
    }
];

// Helper Functions
function getNextBlockNumber(blockType) {
    const count = blockCounters[blockType] || 0;
    const newCount = count + 1;
    blockCounters[blockType] = newCount;
    return newCount;
}

function getColorString(block) {
    if (!block.params.color) return "'blue'";
    const colorValue = block.params.color.value;
    if (colorValue === 'custom' && block.customRGB) {
        return '(' + block.customRGB.r + '/255, ' + block.customRGB.g + '/255, ' + block.customRGB.b + '/255)';
    }
    return "'" + colorValue + "'";
}

function validateLists() {
    const errors = [];
    
    blocks.forEach(block => {
        if (['plot', 'scatter', 'bar'].includes(block.type) && block.dataSlots) {
            const xListName = block.dataSlots.x;
            const yListName = block.dataSlots.y;
            
            if (xListName && yListName) {
                const xList = blocks.find(b => b.type === 'list' && b.params.name.value === xListName);
                const yList = blocks.find(b => b.type === 'list' && b.params.name.value === yListName);
                
                if (xList && yList) {
                    try {
                        const xData = JSON.parse(xList.params.values.value);
                        const yData = JSON.parse(yList.params.values.value);
                        
                        if (xData.length !== yData.length) {
                            errors.push('List length mismatch in ' + block.displayName + ': ' + xListName + ' has ' + xData.length + ' items, ' + yListName + ' has ' + yData.length + ' items');
                        }
                    } catch (e) {
                        errors.push('Invalid list format in ' + block.displayName);
                    }
                }
            }
        }
    });
    return errors;
}

function generateCode() {
    let code = 'import matplotlib.pyplot as plt\nimport numpy as np\n\n';
    
    const listBlocks = blocks.filter(b => b.type === 'list');
    listBlocks.forEach(list => {
        code += list.params.name.value + ' = ' + list.params.values.value + '\n';
    });
    if (listBlocks.length > 0) code += '\n';
    
    const figBlock = blocks.find(b => b.type === 'figure');
    if (figBlock) {
        const nrows = figBlock.params.nrows.value;
        const ncols = figBlock.params.ncols.value;
        const dpi = figBlock.params.dpi.value;
        code += 'fig, ax = plt.subplots(nrows=' + nrows + ', ncols=' + ncols + ', figsize=(' + figBlock.params.width.value + ', ' + figBlock.params.height.value + '), dpi=' + dpi + ')\n';
        
        if (parseInt(nrows) * parseInt(ncols) > 1) {
            code += '# ax is an array of axes. Use ax[row, col] for 2D or ax[index] for 1D\n\n';
        } else {
            code += '# For single subplot, ax is a single axis object\n\n';
        }
        
        blocks.forEach(block => {
            if (block.type === 'figure' || !block.parentId || block.type === 'list') return;
            
            const nrowsNum = parseInt(figBlock.params.nrows.value);
            const ncolsNum = parseInt(figBlock.params.ncols.value);
            const totalAxes = nrowsNum * ncolsNum;
            const axIdx = block.gridIndex !== null ? block.gridIndex : 0;
            
            let axAccessor;
            if (totalAxes === 1) {
                axAccessor = 'ax';
            } else if (nrowsNum === 1 || ncolsNum === 1) {
                axAccessor = 'ax[' + axIdx + ']';
            } else {
                const row = Math.floor(axIdx / ncolsNum);
                const col = axIdx % ncolsNum;
                axAccessor = 'ax[' + row + ', ' + col + ']';
            }
            
            const colorStr = getColorString(block);
            const alpha = block.params.alpha ? block.params.alpha.value : '1.0';
            
            switch(block.type) {
                case 'plot':
                    if (block.dataSlots && block.dataSlots.x && block.dataSlots.y) {
                        code += axAccessor + '.plot(' + block.dataSlots.x + ', ' + block.dataSlots.y + ", label='" + block.params.label.value + "', color=" + colorStr + ', alpha=' + alpha + ')\n';
                    }
                    break;
                case 'scatter':
                    if (block.dataSlots && block.dataSlots.x && block.dataSlots.y) {
                        code += axAccessor + '.scatter(' + block.dataSlots.x + ', ' + block.dataSlots.y + ", label='" + block.params.label.value + "', color=" + colorStr + ', alpha=' + alpha + ')\n';
                    }
                    break;
                case 'bar':
                    if (block.dataSlots && block.dataSlots.x && block.dataSlots.y) {
                        code += axAccessor + '.bar(' + block.dataSlots.x + ', ' + block.dataSlots.y + ", label='" + block.params.label.value + "', color=" + colorStr + ', alpha=' + alpha + ')\n';
                    }
                    break;
                case 'histogram':
                    if (block.dataSlots && block.dataSlots.data) {
                        const bins = block.params.bins ? block.params.bins.value : '10';
                        code += axAccessor + '.hist(' + block.dataSlots.data + ', bins=' + bins + ", label='" + block.params.label.value + "', color=" + colorStr + ', alpha=' + alpha + ')\n';
                    }
                    break;
                case 'title':
                    code += axAccessor + ".set_title('" + block.params.text.value + "')\n";
                    break;
                case 'xlabel':
                    code += axAccessor + ".set_xlabel('" + block.params.text.value + "')\n";
                    break;
                case 'ylabel':
                    code += axAccessor + ".set_ylabel('" + block.params.text.value + "')\n";
                    break;
            }
            
            if (block.params.legend && block.params.legend.value) {
                code += axAccessor + '.legend()\n';
            }
            
            if (block.params.grid && block.params.grid.value) {
                code += axAccessor + '.grid(True, alpha=0.3)\n';
            }
        });
    } else {
        code += "# Add a 'Create Figure' block to start\n";
    }
    
    code += '\nplt.show()';
    return code;
}

async function runCode() {
    const errors = validateLists();
    if (errors.length > 0) {
        showError(errors.join('; '));
        document.getElementById('codeOutput').textContent = '';
        document.getElementById('plotPreview').innerHTML = '<p class="text-gray-400">Fix errors to generate plot</p>';
        return;
    }
    
    hideError();
    const code = generateCode();
    document.getElementById('codeOutput').textContent = code;
    
    setExecuting(true);
    document.getElementById('plotPreview').innerHTML = '<div class="flex flex-col items-center gap-3"><svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="animate-spin text-blue-500"><path d="M21 12a9 9 0 1 1-6.219-8.56"></path></svg><p class="text-gray-600">Generating plot...</p></div>';
    
    try {
        
        const response = await fetch(FLASK_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ code: code })
        });
      
        const data = await response.json();
        console.log(data);
        
        if (data.success) {
     
            document.getElementById('plotPreview').innerHTML = '<img src="data:image/png;base64,' + data.image + '" alt="Matplotlib output" class="max-w-full max-h-full">';
        } else {
          
            showError('Python Error: ' + data.error);
            if (data.traceback) {
                console.error('Python Traceback:', data.traceback);
            }
            document.getElementById('plotPreview').innerHTML = '<p class="text-red-400">Error generating plot</p>';
        }
    } catch (error) {
        showError('Failed to connect to Flask backend. Make sure it is running on ' + FLASK_URL);
        console.error('Fetch error:', error);
        document.getElementById('plotPreview').innerHTML = '<p class="text-red-400">Connection error</p>';
    } finally {
        setExecuting(false);
    }
}

function setExecuting(executing) {
    isExecuting = executing;
    const runButton = document.getElementById('runButton');
    const playIcon = document.getElementById('playIcon');
    const loadingIcon = document.getElementById('loadingIcon');
    const runButtonText = document.getElementById('runButtonText');
    
    if (executing) {
        runButton.disabled = true;
        playIcon.style.display = 'none';
        loadingIcon.style.display = 'block';
        runButtonText.textContent = 'Running...';
    } else {
        runButton.disabled = false;
        playIcon.style.display = 'block';
        loadingIcon.style.display = 'none';
        runButtonText.textContent = 'Run';
    }
}

function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    const errorText = document.getElementById('errorText');
    errorDiv.style.display = 'flex';
    errorText.textContent = message;
}

function hideError() {
    document.getElementById('errorMessage').style.display = 'none';
}

// Block Management
function createBlock(blockType, parentId, slotType, gridIndex) {
    const blockNum = getNextBlockNumber(blockType.id);
    
    const newBlock = {
        id: Date.now() + Math.random(),
        type: blockType.id,
        label: blockType.label,
        displayName: blockType.label + ' ' + blockNum,
        color: blockType.color,
        parentId: parentId || null,
        slotType: slotType || null,
        gridIndex: gridIndex !== undefined ? gridIndex : null,
        params: {},
        dataSlots: blockType.hasDataSlots ? (blockType.singleData ? { data: null } : { x: null, y: null }) : null,
        customRGB: blockType.hasDataSlots ? { r: 0, g: 0, b: 255 } : null,
        gridChildren: blockType.hasGrid ? {} : null
    };
    
    blockType.params.forEach(param => {
        newBlock.params[param.name] = {
            value: param.default,
            type: param.type,
            options: param.options
        };
    });
    
    blocks.push(newBlock);
    renderWorkspace();
}

function removeBlock(blockId) {
    blocks = blocks.filter(b => b.id !== blockId);
    renderWorkspace();
}

function updateBlockParam(blockId, paramName, value) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.params[paramName]) {
        block.params[paramName].value = value;
    }
}

function updateCustomRGB(blockId, component, value) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.customRGB) {
        block.customRGB[component] = parseInt(value) || 0;
    }
}

function setDataSlot(blockId, slotType, listName) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSlots) {
        block.dataSlots[slotType] = listName;
        renderWorkspace();
    }
}

function removeDataSlot(blockId, slotType) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSlots) {
        block.dataSlots[slotType] = null;
        renderWorkspace();
    }
}

// Rendering Functions
function renderBlockPalette() {
    const palette = document.getElementById('blockPalette');
    palette.innerHTML = '';
    
    blockTypes.forEach(blockType => {
        const blockEl = document.createElement('div');
        blockEl.className = blockType.color + ' text-white p-2.5 rounded cursor-move hover:opacity-80 transition-opacity text-sm';
        blockEl.textContent = blockType.label;
        blockEl.draggable = true;
        
        blockEl.addEventListener('dragstart', (e) => {
            draggedBlock = blockType;
            draggedListRef = null;
        });
        
        palette.appendChild(blockEl);
    });
}

function renderWorkspace() {
    const workspace = document.getElementById('workspace');
    workspace.innerHTML = '';
    
    const topLevelBlocks = blocks.filter(b => !b.parentId);
    
    if (topLevelBlocks.length === 0) {
        workspace.innerHTML = '<p class="text-gray-400 text-center py-8">Drag blocks here to start</p>';
        return;
    }
    
    // Render lists in a row
    const listBlocks = blocks.filter(b => b.type === 'list');
    if (listBlocks.length > 0) {
        const listsRow = document.createElement('div');
        listsRow.className = 'flex flex-wrap gap-3';
        listBlocks.forEach(list => {
            listsRow.appendChild(renderListBlock(list));
        });
        workspace.appendChild(listsRow);
    }
    
    // Render figure blocks
    const figureBlocks = blocks.filter(b => b.type === 'figure');
    figureBlocks.forEach(fig => {
        workspace.appendChild(renderFigureBlock(fig));
    });
}

function renderListBlock(listBlock) {
    const container = document.createElement('div');
    container.className = listBlock.color + ' text-white p-4 rounded-lg shadow-md flex-shrink-0';
    
    container.innerHTML = `
        <div class="flex items-center justify-between mb-3">
            <span class="font-semibold">${listBlock.displayName}</span>
            <button class="hover:bg-white hover:bg-opacity-20 p-1 rounded delete-btn">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="3 6 5 6 21 6"></polyline>
                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                </svg>
            </button>
        </div>
        <div class="space-y-2 mb-3">
            <div class="flex items-center gap-2">
                <label class="text-sm font-medium w-16">name:</label>
                <input type="text" value="${listBlock.params.name.value}" class="w-32 px-2 py-1 rounded text-black text-sm name-input">
            </div>
            <div class="flex items-center gap-2">
                <label class="text-sm font-medium w-16">values:</label>
                <input type="text" value="${listBlock.params.values.value}" class="w-32 px-2 py-1 rounded text-black text-sm values-input">
            </div>
        </div>
        <div class="border-t border-white border-opacity-30 pt-3">
            <div class="text-xs opacity-70 mb-2">Drag to use:</div>
            <div class="bg-white bg-opacity-20 px-3 py-2 rounded cursor-move hover:bg-opacity-30 inline-block drag-ref">
                <span class="font-semibold">${listBlock.params.name.value}</span>
            </div>
        </div>
    `;
    
    container.querySelector('.delete-btn').addEventListener('click', () => removeBlock(listBlock.id));
    container.querySelector('.name-input').addEventListener('input', (e) => {
        updateBlockParam(listBlock.id, 'name', e.target.value);
        renderWorkspace();
    });
    container.querySelector('.values-input').addEventListener('input', (e) => updateBlockParam(listBlock.id, 'values', e.target.value));
    
    const dragRef = container.querySelector('.drag-ref');
    dragRef.draggable = true;
    dragRef.addEventListener('dragstart', () => {
        draggedListRef = listBlock.params.name.value;
        draggedBlock = null;
    });
    
    return container;
}

function renderFigureBlock(figBlock) {
    const container = document.createElement('div');
    container.className = figBlock.color + ' text-white p-4 rounded-lg shadow-md inline-block min-w-full';
    
    const nrows = parseInt(figBlock.params.nrows.value);
    const ncols = parseInt(figBlock.params.ncols.value);
    const totalCells = nrows * ncols;
    
    let paramsHTML = '';
    Object.entries(figBlock.params).forEach(([key, param]) => {
        if (param.type === 'dropdown') {
            const options = param.options.map(opt => `<option value="${opt}" ${opt === param.value ? 'selected' : ''}>${opt}</option>`).join('');
            paramsHTML += `
                <div class="flex flex-col gap-1">
                    <label class="text-xs font-medium capitalize">${key}:</label>
                    <select class="px-2 py-1 rounded text-black text-sm param-${key}">${options}</select>
                </div>
            `;
        } else {
            paramsHTML += `
                <div class="flex flex-col gap-1">
                    <label class="text-xs font-medium capitalize">${key}:</label>
                    <input type="text" value="${param.value}" class="px-2 py-1 rounded text-black text-sm param-${key}">
                </div>
            `;
        }
    });
    
    container.innerHTML = `
        <div class="flex items-center justify-between mb-3">
            <span class="font-semibold">${figBlock.displayName}</span>
            <button class="hover:bg-white hover:bg-opacity-20 p-1 rounded delete-btn">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="3 6 5 6 21 6"></polyline>
                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                </svg>
            </button>
        </div>
        <div class="grid grid-cols-5 gap-2 mb-4">${paramsHTML}</div>
        <div class="grid gap-3 grid-cells" style="grid-template-columns: repeat(${ncols}, minmax(0, 1fr))"></div>
    `;
    
    container.querySelector('.delete-btn').addEventListener('click', () => removeBlock(figBlock.id));
    
    Object.keys(figBlock.params).forEach(key => {
        const input = container.querySelector('.param-' + key);
        input.addEventListener('change', (e) => {
            updateBlockParam(figBlock.id, key, e.target.value);
            renderWorkspace();
        });
    });
    
    const gridContainer = container.querySelector('.grid-cells');
    for (let i = 0; i < totalCells; i++) {
        const cell = renderGridCell(figBlock, i);
        gridContainer.appendChild(cell);
    }
    
    return container;
}

function renderGridCell(figBlock, gridIndex) {
    const cell = document.createElement('div');
    cell.className = 'bg-white bg-opacity-20 rounded p-3 border-2 border-dashed border-white border-opacity-40';
    
    const cellBlock = blocks.find(b => b.parentId === figBlock.id && b.gridIndex === gridIndex);
    
    if (!cellBlock) {
        cell.innerHTML = '<div class="text-center text-sm opacity-60 py-8">Drop plot here</div>';
    } else {
        cell.innerHTML = '';
        cell.appendChild(renderPlotBlock(cellBlock));
    }
    
    cell.addEventListener('dragover', (e) => e.preventDefault());
    cell.addEventListener('drop', (e) => {
        e.preventDefault();
        if (draggedBlock && ['plot', 'scatter', 'bar', 'histogram'].includes(draggedBlock.id)) {
            createBlock(draggedBlock, figBlock.id, 'grid', gridIndex);
            draggedBlock = null;
        }
    });
    
    return cell;
}

function renderPlotBlock(block) {
    const container = document.createElement('div');
    container.className = 'space-y-2';
    
    // Main plot block container
    const plotDiv = document.createElement('div');
    plotDiv.className = block.color + ' text-white p-3 rounded';
    
    // Header with delete button
    const header = document.createElement('div');
    header.className = 'flex items-center justify-between mb-2';
    header.innerHTML = `
        <span class="font-semibold text-sm">${block.displayName}</span>
        <button class="hover:bg-white hover:bg-opacity-20 p-1 rounded delete-plot-btn">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="3 6 5 6 21 6"></polyline>
                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
            </svg>
        </button>
    `;
    header.querySelector('.delete-plot-btn').addEventListener('click', () => removeBlock(block.id));
    plotDiv.appendChild(header);
    
    // Data slots
    const dataSlots = document.createElement('div');
    dataSlots.className = 'space-y-1.5 mb-2';
    
    if (block.type === 'histogram') {
        dataSlots.appendChild(createDataSlot(block, 'data', 'Drop list'));
    } else {
        dataSlots.appendChild(createDataSlot(block, 'x', 'Drop list'));
        dataSlots.appendChild(createDataSlot(block, 'y', 'Drop list'));
    }
    
    plotDiv.appendChild(dataSlots);
    
    // Parameters
    const params = document.createElement('div');
    params.className = 'space-y-1.5';
    
    // Label input
    if (block.params.label) {
        const labelDiv = document.createElement('div');
        labelDiv.className = 'flex items-center gap-1.5';
        labelDiv.innerHTML = `
            <label class="text-xs w-12 flex-shrink-0">label:</label>
            <input type="text" value="${block.params.label.value}" class="flex-1 min-w-0 px-1.5 py-1 rounded text-black text-xs label-input">
        `;
        labelDiv.querySelector('.label-input').addEventListener('input', (e) => updateBlockParam(block.id, 'label', e.target.value));
        params.appendChild(labelDiv);
    }
    
    // Bins input (for histogram)
    if (block.params.bins) {
        const binsDiv = document.createElement('div');
        binsDiv.className = 'flex items-center gap-1.5';
        binsDiv.innerHTML = `
            <label class="text-xs w-12 flex-shrink-0">bins:</label>
            <input type="text" value="${block.params.bins.value}" class="flex-1 min-w-0 px-1.5 py-1 rounded text-black text-xs bins-input">
        `;
        binsDiv.querySelector('.bins-input').addEventListener('input', (e) => updateBlockParam(block.id, 'bins', e.target.value));
        params.appendChild(binsDiv);
    }
    
    // Color selector
    if (block.params.color) {
        const colorDiv = document.createElement('div');
        colorDiv.className = 'space-y-1';
        
        const colorSelect = document.createElement('div');
        colorSelect.className = 'flex items-center gap-1.5';
        
        const colorOptions = ['red', 'blue', 'green', 'purple', 'orange', 'yellow', 'custom'];
        const optionsHTML = colorOptions.map(opt => `<option value="${opt}" ${opt === block.params.color.value ? 'selected' : ''}>${opt}</option>`).join('');
        
        colorSelect.innerHTML = `
            <label class="text-xs w-12 flex-shrink-0">color:</label>
            <select class="flex-1 min-w-0 px-1.5 py-1 rounded text-black text-xs color-select">${optionsHTML}</select>
        `;
        
        colorSelect.querySelector('.color-select').addEventListener('change', (e) => {
            updateBlockParam(block.id, 'color', e.target.value);
            renderWorkspace();
        });
        
        colorDiv.appendChild(colorSelect);
        
        // Custom RGB inputs
        if (block.params.color.value === 'custom' && block.customRGB) {
            const rgbDiv = document.createElement('div');
            rgbDiv.className = 'flex gap-1 ml-12';
            rgbDiv.innerHTML = `
                <input type="number" min="0" max="255" value="${block.customRGB.r}" placeholder="R" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-r">
                <input type="number" min="0" max="255" value="${block.customRGB.g}" placeholder="G" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-g">
                <input type="number" min="0" max="255" value="${block.customRGB.b}" placeholder="B" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-b">
            `;
            rgbDiv.querySelector('.rgb-r').addEventListener('input', (e) => updateCustomRGB(block.id, 'r', e.target.value));
            rgbDiv.querySelector('.rgb-g').addEventListener('input', (e) => updateCustomRGB(block.id, 'g', e.target.value));
            rgbDiv.querySelector('.rgb-b').addEventListener('input', (e) => updateCustomRGB(block.id, 'b', e.target.value));
            colorDiv.appendChild(rgbDiv);
        }
        
        params.appendChild(colorDiv);
    }
    
    // Alpha input
    if (block.params.alpha) {
        const alphaDiv = document.createElement('div');
        alphaDiv.className = 'flex items-center gap-1.5';
        alphaDiv.innerHTML = `
            <label class="text-xs w-12 flex-shrink-0">alpha:</label>
            <input type="text" value="${block.params.alpha.value}" placeholder="0.0 - 1.0" class="flex-1 min-w-0 px-1.5 py-1 rounded text-black text-xs alpha-input">
        `;
        alphaDiv.querySelector('.alpha-input').addEventListener('input', (e) => updateBlockParam(block.id, 'alpha', e.target.value));
        params.appendChild(alphaDiv);
    }
    
    // Toggles (legend and grid)
    const togglesDiv = document.createElement('div');
    togglesDiv.className = 'flex gap-3 pt-1';
    
    if (block.params.legend) {
        const legendLabel = document.createElement('label');
        legendLabel.className = 'flex items-center gap-1.5 cursor-pointer';
        legendLabel.innerHTML = `
            <input type="checkbox" ${block.params.legend.value ? 'checked' : ''} class="rounded legend-toggle">
            <span class="text-xs">legend</span>
        `;
        legendLabel.querySelector('.legend-toggle').addEventListener('change', (e) => updateBlockParam(block.id, 'legend', e.target.checked));
        togglesDiv.appendChild(legendLabel);
    }
    
    if (block.params.grid) {
        const gridLabel = document.createElement('label');
        gridLabel.className = 'flex items-center gap-1.5 cursor-pointer';
        gridLabel.innerHTML = `
            <input type="checkbox" ${block.params.grid.value ? 'checked' : ''} class="rounded grid-toggle">
            <span class="text-xs">grid</span>
        `;
        gridLabel.querySelector('.grid-toggle').addEventListener('change', (e) => updateBlockParam(block.id, 'grid', e.target.checked));
        togglesDiv.appendChild(gridLabel);
    }
    
    params.appendChild(togglesDiv);
    plotDiv.appendChild(params);
    container.appendChild(plotDiv);
    
    // Label slots (title, xlabel, ylabel)
    const labelsGrid = document.createElement('div');
    labelsGrid.className = 'grid grid-cols-2 gap-2';
    
    labelsGrid.appendChild(createLabelSlot(block, 'title', 'Title'));
    labelsGrid.appendChild(createLabelSlot(block, 'xlabel', 'X Label'));
    labelsGrid.appendChild(createLabelSlot(block, 'ylabel', 'Y Label'));
    
    container.appendChild(labelsGrid);
    
    return container;
}

function createDataSlot(block, slotType, placeholder) {
    const slotDiv = document.createElement('div');
    slotDiv.className = 'flex items-center gap-1.5';
    
    const label = document.createElement('label');
    label.className = 'text-xs w-12 flex-shrink-0';
    label.textContent = slotType + ':';
    
    const dropZone = document.createElement('div');
    dropZone.className = 'bg-white bg-opacity-30 rounded border-2 border-dashed border-white border-opacity-50 p-1.5 flex items-center justify-center min-h-8 flex-1';
    
    const slotValue = block.dataSlots && block.dataSlots[slotType];
    
    if (!slotValue) {
        dropZone.innerHTML = `<div class="text-xs opacity-70 text-center">${placeholder}</div>`;
    } else {
        dropZone.innerHTML = `
            <div class="bg-indigo-600 text-white px-2 py-1 rounded text-xs font-semibold flex items-center gap-1">
                ${slotValue}
                <button class="hover:bg-white hover:bg-opacity-20 rounded remove-slot">
                    <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="3 6 5 6 21 6"></polyline>
                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                    </svg>
                </button>
            </div>
        `;
        dropZone.querySelector('.remove-slot').addEventListener('click', () => removeDataSlot(block.id, slotType));
    }
    
    dropZone.addEventListener('dragover', (e) => e.preventDefault());
    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        if (draggedListRef) {
            setDataSlot(block.id, slotType, draggedListRef);
            draggedListRef = null;
        }
    });
    
    slotDiv.appendChild(label);
    slotDiv.appendChild(dropZone);
    
    return slotDiv;
}

function createLabelSlot(parentBlock, slotType, placeholder) {
    const dropZone = document.createElement('div');
    dropZone.className = 'bg-white bg-opacity-20 rounded border-2 border-dashed border-white border-opacity-40 p-2 flex items-center justify-center';
    
    const slotBlock = blocks.find(b => b.parentId === parentBlock.id && b.type === slotType);
    
    if (!slotBlock) {
        dropZone.innerHTML = `<div class="text-xs opacity-60 text-center">${placeholder}</div>`;
    } else {
        const blockColor = slotBlock.color;
        dropZone.innerHTML = `
            <div class="${blockColor} text-white p-2 rounded w-full">
                <div class="flex items-center justify-between mb-1">
                    <span class="font-semibold text-xs">${slotBlock.label}</span>
                    <button class="hover:bg-white hover:bg-opacity-20 p-0.5 rounded delete-label-btn">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        </svg>
                    </button>
                </div>
                <input type="text" value="${slotBlock.params.text.value}" class="w-full px-1 py-0.5 rounded text-black text-xs label-text-input">
            </div>
        `;
        dropZone.querySelector('.delete-label-btn').addEventListener('click', () => removeBlock(slotBlock.id));
        dropZone.querySelector('.label-text-input').addEventListener('input', (e) => updateBlockParam(slotBlock.id, 'text', e.target.value));
    }
    
    dropZone.addEventListener('dragover', (e) => e.preventDefault());
    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        if (draggedBlock && draggedBlock.id === slotType) {
            createBlock(draggedBlock, parentBlock.id, slotType);
            draggedBlock = null;
        }
    });
    
    return dropZone;
}

// Initialize
function init() {
    renderBlockPalette();
    
    document.getElementById('runButton').addEventListener('click', runCode);
    
    const workspace = document.getElementById('workspace');
    workspace.addEventListener('dragover', (e) => e.preventDefault());
    workspace.addEventListener('drop', (e) => {
        e.preventDefault();
        if (draggedBlock && (draggedBlock.id === 'figure' || draggedBlock.id === 'list')) {
            createBlock(draggedBlock);
            draggedBlock = null;
        }
    });
}

document.addEventListener('DOMContentLoaded', init);