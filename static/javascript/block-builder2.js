// Configuration
const FLASK_URL = '/plt-blocks/execute_plot';
const colorOptions = ['red', 'blue', 'green', 'purple', 'orange', 'yellow', 'custom'];

// State
let blocks = [];
let draggedBlock = null;
let draggedListRef = null;
let blockCounters = {};
let isExecuting = false;
let isDarkMode = false;
let currentFigureIndex = 0;

// Block Type Definitions organized by sections
const blockSections = [
    {
        name: 'Create',
        blocks: [
            { 
                id: 'figure', 
                label: 'Create Figure', 
                displayLabel: 'Figure',
                color: 'bg-blue-500',
                size: 'normal',
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
                size: 'normal',
                params: [
                    { name: 'name', default: 'myList', type: 'text' },
                    { name: 'values', default: '1,2,3,4,5', type: 'list' }
                ],
                isTopLevel: true
            }
        ]
    },
    {
        name: 'Plot Types',
        blocks: [
            { 
                id: 'plot', 
                label: 'Line Plot', 
                color: 'bg-green-500',
                size: 'small',
                params: [
                    { name: 'label', default: 'Line 1', type: 'text' },
                    { name: 'color', default: 'blue', type: 'color' },
                    { name: 'facecolor', default: 'white', type: 'facecolor' },
                    { name: 'legend', default: false, type: 'toggle' },
                    { name: 'grid', default: false, type: 'toggle' }
                ],
                hasSlots: true,
                hasDataSlots: true,
                multipleDataSets: true
            },
            { 
                id: 'scatter', 
                label: 'Scatter Plot', 
                color: 'bg-purple-500',
                size: 'small',
                params: [
                    { name: 'label', default: 'Points', type: 'text' },
                    { name: 'color', default: 'purple', type: 'color' },
                    { name: 'facecolor', default: 'white', type: 'facecolor' },
                    { name: 'legend', default: false, type: 'toggle' },
                    { name: 'grid', default: false, type: 'toggle' }
                ],
                hasSlots: true,
                hasDataSlots: true,
                multipleDataSets: true
            },
            { 
                id: 'bar', 
                label: 'Bar Chart', 
                color: 'bg-orange-500',
                size: 'small',
                params: [
                    { name: 'label', default: 'Bars', type: 'text' },
                    { name: 'color', default: 'orange', type: 'color' },
                    { name: 'facecolor', default: 'white', type: 'facecolor' },
                    { name: 'legend', default: false, type: 'toggle' },
                    { name: 'grid', default: false, type: 'toggle' }
                ],
                hasSlots: true,
                hasDataSlots: true,
                multipleDataSets: true
            },
            { 
                id: 'histogram', 
                label: 'Histogram', 
                color: 'bg-teal-500',
                size: 'small',
                params: [
                    { name: 'label', default: 'Hist', type: 'text' },
                    { name: 'bins', default: '10', type: 'text' },
                    { name: 'color', default: 'blue', type: 'color' },
                    { name: 'facecolor', default: 'white', type: 'facecolor' },
                    { name: 'legend', default: false, type: 'toggle' },
                    { name: 'grid', default: false, type: 'toggle' }
                ],
                hasSlots: true,
                hasDataSlots: true,
                singleData: true
            }
        ]
    },
    {
        name: 'Plot Attributes',
        blocks: [
            { 
                id: 'xlabel', 
                label: 'X-Axis Label', 
                color: 'bg-cyan-500',
                size: 'tiny',
                params: [
                    { name: 'text', default: 'X Axis', type: 'text' }
                ],
                isSmall: true
            },
            { 
                id: 'title', 
                label: 'Set Title', 
                color: 'bg-pink-500',
                size: 'tiny',
                params: [
                    { name: 'text', default: 'My Chart', type: 'text' }
                ],
                isSmall: true
            },
            { 
                id: 'ylabel', 
                label: 'Y-Axis Label', 
                color: 'bg-cyan-500',
                size: 'tiny',
                params: [
                    { name: 'text', default: 'Y Axis', type: 'text' }
                ],
                isSmall: true
            }
        ]
    }
];

const blockTypes = blockSections.flatMap(section => section.blocks);

// Helper Functions
function getNextBlockNumber(blockType) {
    const count = blockCounters[blockType] || 0;
    const newCount = count + 1;
    blockCounters[blockType] = newCount;
    return newCount;
}

function getColorString(block, paramName) {
    if (!block.params[paramName]) return "'blue'";
    const colorValue = block.params[paramName].value;
    
    if (colorValue === 'custom' && block.customRGB && block.customRGB[paramName]) {
        const rgb = block.customRGB[paramName];
        const alpha = block.params.alpha && block.params.alpha.value ? ', ' + block.params.alpha.value : '';
        return '(' + rgb.r + '/255, ' + rgb.g + '/255, ' + rgb.b + '/255' + alpha + ')';
    }
    return "'" + colorValue + "'";
}

function validateLists() {
    const errors = [];
    
    blocks.forEach(block => {
        if (['plot', 'scatter', 'bar'].includes(block.type) && block.dataSets) {
            block.dataSets.forEach((dataSet, index) => {
                const xListName = dataSet.x;
                const yListName = dataSet.y;
                
                if (xListName && yListName) {
                    const xList = blocks.find(b => b.type === 'list' && b.params.name.value === xListName);
                    const yList = blocks.find(b => b.type === 'list' && b.params.name.value === yListName);
                    
                    if (xList && yList) {
                        try {
                            const xData = JSON.parse('[' + xList.params.values.value + ']');
                            const yData = JSON.parse('[' + yList.params.values.value + ']');
                            
                            if (xData.length !== yData.length) {
                                errors.push('List length mismatch in ' + block.displayName + ' dataset ' + (index + 1) + ': ' + xListName + ' has ' + xData.length + ' items, ' + yListName + ' has ' + yData.length + ' items');
                            }
                        } catch (e) {
                            errors.push('Invalid list format in ' + block.displayName + ' dataset ' + (index + 1));
                        }
                    }
                }
            });
        }
    });
    return errors;
}

function generateCode() {
    let code = 'import matplotlib.pyplot as plt\nimport numpy as np\n\n';
    
    const listBlocks = blocks.filter(b => b.type === 'list');
    listBlocks.forEach(list => {
        code += list.params.name.value + ' = [' + list.params.values.value + ']\n';
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
            
            const colorStr = getColorString(block, 'color');
            const facecolorStr = getColorString(block, 'facecolor');
            
            switch(block.type) {
                case 'plot':
                case 'scatter':
                case 'bar':
                    if (block.dataSets && block.dataSets.length > 0) {
                        block.dataSets.forEach((dataSet, idx) => {
                            if (dataSet.x && dataSet.y) {
                                const plotMethod = block.type;
                                const label = block.dataSets.length > 1 ? block.params.label.value + ' (' + (idx + 1) + ')' : block.params.label.value;
                                code += axAccessor + '.' + plotMethod + '(' + dataSet.x + ', ' + dataSet.y + ", label='" + label + "', color=" + colorStr + ")\n";
                            }
                        });
                    }
                    
                    // Add facecolor for axis background
                    if (block.params.facecolor) {
                        code += axAccessor + '.set_facecolor(' + facecolorStr + ')\n';
                    }
                    break;
                case 'histogram':
                    if (block.dataSlots && block.dataSlots.data) {
                        const bins = block.params.bins ? block.params.bins.value : '10';
                        code += axAccessor + '.hist(' + block.dataSlots.data + ', bins=' + bins + ", label='" + block.params.label.value + "', color=" + colorStr + ")\n";
                    }
                    
                    if (block.params.facecolor) {
                        code += axAccessor + '.set_facecolor(' + facecolorStr + ')\n';
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

function escapeHtml(s) {
  return s.replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;');
}

function highlightCode(code) {
    // Escape HTML for the user's original code so it can't break markup
    code = escapeHtml(code);

    // Now apply tokenization — we insert HTML <span class="..."> tokens.
    // Work on the whole string (not per-line), then return.
    // Note: use function form of replace when you want safe insertion of the matched text.
    // Keywords
    code = code.replace(/\b(import|from|as|if|else|elif|for|while|return)\b/g,
                        (m) => `<span class="code-kw">${m}</span>`);
    // Other keywords
    code = code.replace(/\b(def|class?!\s*=|None|True|False)\b/g,
                        (m) => `<span class="code-mod">${m}</span>`);
    // Numbers
    code = code.replace(/\b(\d+\.?\d*)\b/g,
                        (m) => `<span class="code-num">${m}</span>`);
    // Function names
    code = code.replace(/\b(subplots|plot|scatter|bar|hist|set_title|set_xlabel|set_ylabel|set_facecolor|legend|grid|show)\b/g,
                        (m) => `<span class="code-fn">${m}</span>`);
    // Strings (single quotes)
    code = code.replace(/('[^']*')/g,
                        (m) => `<span class="code-str">${m}</span>`);
    // Brackets and parentheses
    const colors = ["code-pn1", "code-pn2", "code-pn3"]; // Tailwind arbitrary text colors
    
    let level = 0;
    code = code.replace(/[()[\]]/g, (char) => {
        let color;
        if (char === "(" || char === "[") {
            color = colors[level % colors.length];
            level++;
            console.log(level);
        } else {
            level--;
            color = colors[level % colors.length];
            console.log(level);
        }
        return `<span class="${color}">${char}</span>`;
    });

    // Comments (match '#' plus rest of line). We escaped HTML earlier so '#' is safe.
    code = code.replace(/(#[^\n]*)/g,
                        (m) => `<span class="code-cm">${m}</span>`);

    return code;
}

/*
function highlightCode(code) {
    // Escape HTML first
    code = code.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    
    // Split into lines and process each line
    const lines = code.split('\n');
    const highlightedLines = lines.map(line => {
        // Keywords
        line = line.replace(/\b(import|from|as|def|class|if|else|elif|for|while|return|True|False|None)\b/g, '<span style="color:#C678DD;">$1</span>');
        // Module names
        line = line.replace(/\b(plt|np|ax|fig)\b/g, '<span style="color:#61AFEF;">$1</span>');
        // Numbers
        line = line.replace(/\b(\d+\.?\d*)\b/g, '<span style="color:#D19A66;">$1</span>');
        // Comments
        line = line.replace(/(#[^\n]*)/g, '<span style="color:#5C6370;font-style:italic">$1</span>');
        // Function names
        line = line.replace(/\b(subplots|plot|scatter|bar|hist|set_title|set_xlabel|set_ylabel|set_facecolor|legend|grid|show)\b/g, '<span style="color:#E5C07B;">$1</span>');
        // Strings (single quotes)
        line = line.replace(/('[^']*')/g, '<span style="color:#98C379;">$1</span>');
        
        return line;
    });
    
    return highlightedLines.join('\n');
}*/

async function runCode() {
    const errors = validateLists();
    if (errors.length > 0) {
        showError(errors.join('; '));
        document.getElementById('codeOutput').innerHTML = '';
        document.getElementById('plotPreview').innerHTML = '<p class="text-gray-400">Fix errors to generate plot</p>';
        return;
    }
    
    hideError();
    
    // Get all figure blocks and generate code for each
    const figureBlocks = blocks.filter(b => b.type === 'figure');
    
    if (figureBlocks.length === 0) {
        document.getElementById('codeOutput').innerHTML = highlightCode("# Add a 'Create Figure' block to start");
        return;
    }
    
    currentFigureIndex = Math.min(currentFigureIndex, figureBlocks.length - 1);
    const currentFigure = figureBlocks[currentFigureIndex];
    
    const code = generateCodeForFigure(currentFigure);
    document.getElementById('codeOutput').innerHTML = highlightCode(code);
    
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
        
        if (data.success) {
            const imgEl = '<img src="data:image/png;base64,' + data.image + '" alt="Matplotlib output" class="max-w-full max-h-full">';
            
            // Add navigation if multiple figures
            if (figureBlocks.length > 1) {
                const nav = '<div class="flex items-center justify-center gap-4 mt-3">' +
                    '<button id="prevFig" class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:bg-gray-400" ' + 
                    (currentFigureIndex === 0 ? 'disabled' : '') + '>← Prev</button>' +
                    '<span class="text-sm text-gray-600">Figure ' + (currentFigureIndex + 1) + ' of ' + figureBlocks.length + '</span>' +
                    '<button id="nextFig" class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:bg-gray-400" ' +
                    (currentFigureIndex === figureBlocks.length - 1 ? 'disabled' : '') + '>Next →</button>' +
                    '</div>';
                document.getElementById('plotPreview').innerHTML = imgEl + nav;
                
                document.getElementById('prevFig').addEventListener('click', () => {
                    currentFigureIndex--;
                    runCode();
                });
                document.getElementById('nextFig').addEventListener('click', () => {
                    currentFigureIndex++;
                    runCode();
                });
            } else {
                document.getElementById('plotPreview').innerHTML = imgEl;
            }
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

function generateCodeForFigure(figBlock) {
    let code = 'import matplotlib.pyplot as plt\nimport numpy as np\n\n';
    
    const listBlocks = blocks.filter(b => b.type === 'list');
    listBlocks.forEach(list => {
        code += list.params.name.value + ' = [' + list.params.values.value + ']\n';
    });
    if (listBlocks.length > 0) code += '\n';
    
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
        if (block.parentId !== figBlock.id || block.type === 'list') return;
        
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
        
        const colorStr = getColorString(block, 'color');
        const facecolorStr = getColorString(block, 'facecolor');
        
        switch(block.type) {
            case 'plot':
            case 'scatter':
            case 'bar':
                if (block.dataSets && block.dataSets.length > 0) {
                    block.dataSets.forEach((dataSet, idx) => {
                        if (dataSet.x && dataSet.y) {
                            const plotMethod = block.type;
                            const label = block.dataSets.length > 1 ? block.params.label.value + ' (' + (idx + 1) + ')' : block.params.label.value;
                            code += axAccessor + '.' + plotMethod + '(' + dataSet.x + ', ' + dataSet.y + ", label='" + label + "', color=" + colorStr + ")\n";
                        }
                    });
                }
                
                if (block.params.facecolor) {
                    code += axAccessor + '.set_facecolor(' + facecolorStr + ')\n';
                }
                break;
            case 'histogram':
                if (block.dataSlots && block.dataSlots.data) {
                    const bins = block.params.bins ? block.params.bins.value : '10';
                    code += axAccessor + '.hist(' + block.dataSlots.data + ', bins=' + bins + ", label='" + block.params.label.value + "', color=" + colorStr + ")\n";
                }
                
                if (block.params.facecolor) {
                    code += axAccessor + '.set_facecolor(' + facecolorStr + ')\n';
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
    
    code += '\nplt.show()';
    return code;
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
        runButtonText.textContent = 'RUN';
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

function toggleDarkMode() {
    isDarkMode = !isDarkMode;
    const body = document.body;
    const app = document.getElementById('app');
    
    if (isDarkMode) {
        body.style.backgroundColor = '#1e1e1e';
        app.classList.remove('bg-gray-100');
        app.classList.add('bg-gray-900');
        
        document.querySelectorAll('.bg-white').forEach(el => {
            if (!el.closest('.drop-zone') && el.id !== 'darkModeContainer') {
                el.classList.remove('bg-white');
                el.classList.add('bg-gray-800');
                el.style.borderColor = '#374151';
            }
        });
        
        document.querySelectorAll('.text-gray-700, .text-gray-600').forEach(el => {
            el.style.color = '#d1d5db';
        });
        
        document.querySelectorAll('h1, h2, h3').forEach(el => {
            el.style.color = '#f3f4f6';
        });
        
        const workspace = document.querySelector('.bg-gray-50');
        if (workspace) {
            workspace.classList.remove('bg-gray-50');
            workspace.classList.add('bg-gray-800');
        }
        
        const codeBlock = document.getElementById('codeOutput');
        if (codeBlock && codeBlock.parentElement) {
            codeBlock.parentElement.style.backgroundColor = '#282c34';
        }
    } else {
        body.style.backgroundColor = '';
        app.classList.remove('bg-gray-900');
        app.classList.add('bg-gray-100');
        
        document.querySelectorAll('.bg-gray-800').forEach(el => {
            if (el.id !== 'darkModeContainer') {
                el.classList.remove('bg-gray-800');
                el.classList.add('bg-white');
                el.style.borderColor = '';
            }
        });
        
        document.querySelectorAll('.text-gray-700, .text-gray-600, h1, h2, h3').forEach(el => {
            el.style.color = '';
        });
        
        const workspace = document.querySelector('.bg-gray-800');
        if (workspace && !workspace.classList.contains('drop-zone')) {
            workspace.classList.remove('bg-gray-800');
            workspace.classList.add('bg-gray-50');
        }
        
        const codeBlock = document.getElementById('codeOutput');
        if (codeBlock && codeBlock.parentElement) {
            codeBlock.parentElement.style.backgroundColor = '';
        }
    }
}

// Block Management
function createBlock(blockType, parentId, slotType, gridIndex) {
    const blockNum = getNextBlockNumber(blockType.id);
    const displayLabel = blockType.displayLabel || blockType.label;
    
    const newBlock = {
        id: Date.now() + Math.random(),
        type: blockType.id,
        label: blockType.label,
        displayName: displayLabel + ' ' + blockNum,
        color: blockType.color,
        parentId: parentId || null,
        slotType: slotType || null,
        gridIndex: gridIndex !== undefined ? gridIndex : null,
        params: {},
        dataSlots: blockType.singleData ? { data: null } : null,
        dataSets: blockType.multipleDataSets ? [{ x: null, y: null }] : null,
        customRGB: blockType.hasDataSlots ? { color: { r: 0, g: 0, b: 255 }, facecolor: { r: 255, g: 255, b: 255 } } : null,
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

function updateCustomRGB(blockId, paramName, component, value) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.customRGB && block.customRGB[paramName]) {
        block.customRGB[paramName][component] = parseInt(value) || 0;
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

function setDataSetSlot(blockId, dataSetIndex, slotType, listName) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSets && block.dataSets[dataSetIndex]) {
        block.dataSets[dataSetIndex][slotType] = listName;
        renderWorkspace();
    }
}

function removeDataSetSlot(blockId, dataSetIndex, slotType) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSets && block.dataSets[dataSetIndex]) {
        block.dataSets[dataSetIndex][slotType] = null;
        renderWorkspace();
    }
}

function addDataSet(blockId) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSets) {
        block.dataSets.push({ x: null, y: null });
        renderWorkspace();
    }
}

function removeDataSet(blockId, dataSetIndex) {
    const block = blocks.find(b => b.id === blockId);
    if (block && block.dataSets && block.dataSets.length > 1) {
        block.dataSets.splice(dataSetIndex, 1);
        renderWorkspace();
    }
}

function addDropZoneHighlight(element) {
    element.classList.add('bg-gray-300', 'border-gray-400');
}

function removeDropZoneHighlight(element) {
    element.classList.remove('bg-gray-300', 'border-gray-400');
}

// Rendering Functions
function renderBlockPalette() {
    const palette = document.getElementById('blockPalette');
    palette.innerHTML = '';
    
    blockSections.forEach(section => {
        const sectionHeader = document.createElement('div');
        sectionHeader.className = 'text-sm font-bold text-gray-700 mt-4 mb-2 uppercase tracking-wide';
        sectionHeader.textContent = section.name;
        palette.appendChild(sectionHeader);
        
        const sectionContainer = document.createElement('div');
        
        if (section.name === 'Plot Attributes') {
            sectionContainer.className = 'grid grid-cols-2 gap-1.5';
        } else {
            sectionContainer.className = 'space-y-2';
        }
        
        section.blocks.forEach(blockType => {
            const blockEl = document.createElement('div');
            
            let sizeClass = 'p-2.5 text-sm';
            if (blockType.size === 'small') {
                sizeClass = 'p-2 text-xs';
            } else if (blockType.size === 'tiny') {
                sizeClass = 'p-1.5 text-xs';
            }
            
            blockEl.className = blockType.color + ' text-white rounded cursor-move hover:opacity-80 transition-opacity ' + sizeClass;
            blockEl.textContent = blockType.label;
            blockEl.draggable = true;
            
            blockEl.addEventListener('dragstart', (e) => {
                draggedBlock = blockType;
                draggedListRef = null;
            });
            
            sectionContainer.appendChild(blockEl);
        });
        
        palette.appendChild(sectionContainer);
    });
    
    const darkModeContainer = document.createElement('div');
    darkModeContainer.id = 'darkModeContainer';
    darkModeContainer.style.cssText = 'position: fixed; bottom: 20px; left: 20px; z-index: 1000;';
    
    const darkModeToggle = document.createElement('div');
    darkModeToggle.className = 'bg-white border border-gray-300 rounded-lg p-3';
    darkModeToggle.innerHTML = `
        <label class="flex items-center gap-2 cursor-pointer">
            <input type="checkbox" id="darkModeToggle" class="rounded">
            <span class="text-sm text-gray-700 font-medium">Dark Mode</span>
        </label>
    `;
    
    darkModeContainer.appendChild(darkModeToggle);
    document.body.appendChild(darkModeContainer);
    
    document.getElementById('darkModeToggle').addEventListener('change', toggleDarkMode);
}

function renderWorkspace() {
    const workspace = document.getElementById('workspace');
    workspace.innerHTML = '';
    
    const topLevelBlocks = blocks.filter(b => !b.parentId);
    
    if (topLevelBlocks.length === 0) {
        workspace.innerHTML = '<p class="text-gray-400 text-center py-8">Drag blocks here to start</p>';
        return;
    }
    
    const listBlocks = blocks.filter(b => b.type === 'list');
    if (listBlocks.length > 0) {
        const listsRow = document.createElement('div');
        listsRow.className = 'flex flex-wrap gap-3';
        listBlocks.forEach(list => {
            listsRow.appendChild(renderListBlock(list));
        });
        workspace.appendChild(listsRow);
    }
    
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
                <input type="text" value="[${listBlock.params.values.value}]" class="w-32 px-2 py-1 rounded text-black text-sm values-input">
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
    container.querySelector('.values-input').addEventListener('input', (e) => {
        let value = e.target.value;
        if (value.startsWith('[')) value = value.substring(1);
        if (value.endsWith(']')) value = value.substring(0, value.length - 1);
        updateBlockParam(listBlock.id, 'values', value);
    });
    
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
    cell.className = 'bg-white bg-opacity-20 rounded p-3 border-2 border-dashed border-white border-opacity-40 drop-zone';
    
    const cellBlock = blocks.find(b => b.parentId === figBlock.id && b.gridIndex === gridIndex);
    
    if (!cellBlock) {
        cell.innerHTML = '<div class="text-center text-sm opacity-60 py-8">Drop plot here</div>';
    } else {
        cell.innerHTML = '';
        cell.appendChild(renderPlotBlock(cellBlock));
    }
    
    cell.addEventListener('dragover', (e) => {
        e.preventDefault();
        if (draggedBlock && ['plot', 'scatter', 'bar', 'histogram'].includes(draggedBlock.id)) {
            addDropZoneHighlight(cell);
        }
    });
    
    cell.addEventListener('dragleave', (e) => {
        removeDropZoneHighlight(cell);
    });
    
    cell.addEventListener('drop', (e) => {
        e.preventDefault();
        removeDropZoneHighlight(cell);
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
    
    const plotDiv = document.createElement('div');
    plotDiv.className = block.color + ' text-white p-3 rounded';
    
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
    
    const dataContainer = document.createElement('div');
    dataContainer.className = 'space-y-2 mb-2';
    
    if (block.type === 'histogram') {
        dataContainer.appendChild(createDataSlot(block, 'data', 'Drop list'));
    } else if (block.dataSets) {
        block.dataSets.forEach((dataSet, index) => {
            const dataSetDiv = document.createElement('div');
            dataSetDiv.className = 'space-y-1.5 p-2 bg-white bg-opacity-10 rounded';
            
            const xLabel = block.dataSets.length > 1 ? 'x₁'.replace('1', String(index + 1)) : 'x';
            const yLabel = block.dataSets.length > 1 ? 'y₁'.replace('1', String(index + 1)) : 'y';
            
            dataSetDiv.appendChild(createMultiDataSlot(block, index, 'x', xLabel, 'Drop list'));
            dataSetDiv.appendChild(createMultiDataSlot(block, index, 'y', yLabel, 'Drop list'));
            
            if (block.dataSets.length > 1) {
                const removeBtn = document.createElement('button');
                removeBtn.className = 'text-xs text-white hover:bg-white hover:bg-opacity-20 px-2 py-1 rounded mt-1';
                removeBtn.textContent = 'Remove Dataset';
                removeBtn.addEventListener('click', () => removeDataSet(block.id, index));
                dataSetDiv.appendChild(removeBtn);
            }
            
            dataContainer.appendChild(dataSetDiv);
        });
        
        const addBtn = document.createElement('button');
        addBtn.className = 'text-xs text-white bg-white bg-opacity-20 hover:bg-opacity-30 px-3 py-1.5 rounded flex items-center gap-1';
        addBtn.innerHTML = `
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="12" y1="5" x2="12" y2="19"></line>
                <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            Add Dataset
        `;
        addBtn.addEventListener('click', () => addDataSet(block.id));
        dataContainer.appendChild(addBtn);
    }
    
    plotDiv.appendChild(dataContainer);
    
    const params = document.createElement('div');
    params.className = 'space-y-1.5';
    
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
    
    if (block.params.color) {
        params.appendChild(createColorSelector(block, 'color', 'color'));
    }
    
    if (block.params.facecolor) {
        params.appendChild(createColorSelector(block, 'facecolor', 'face color'));
    }
    
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
    
    const labelsGrid = document.createElement('div');
    labelsGrid.className = 'grid grid-cols-2 gap-2';
    
    labelsGrid.appendChild(createLabelSlot(block, 'title', 'Title'));
    labelsGrid.appendChild(createLabelSlot(block, 'xlabel', 'X Label'));
    labelsGrid.appendChild(createLabelSlot(block, 'ylabel', 'Y Label'));
    
    container.appendChild(labelsGrid);
    
    return container;
}

function createColorSelector(block, paramName, displayName) {
    const colorDiv = document.createElement('div');
    colorDiv.className = 'space-y-1';
    
    const colorSelect = document.createElement('div');
    colorSelect.className = 'flex items-center gap-1.5';
    
    const options = ['red', 'blue', 'green', 'purple', 'orange', 'yellow', 'custom'];
    
    const optionsHTML = options.map(opt => `<option value="${opt}" ${opt === block.params[paramName].value ? 'selected' : ''}>${opt}</option>`).join('');
    
    colorSelect.innerHTML = `
        <label class="text-xs w-16 flex-shrink-0">${displayName}:</label>
        <select class="flex-1 min-w-0 px-1.5 py-1 rounded text-black text-xs color-select">${optionsHTML}</select>
    `;
    
    colorSelect.querySelector('.color-select').addEventListener('change', (e) => {
        updateBlockParam(block.id, paramName, e.target.value);
        renderWorkspace();
    });
    
    colorDiv.appendChild(colorSelect);
    
    if (block.params[paramName].value === 'custom' && block.customRGB && block.customRGB[paramName]) {
        const rgbDiv = document.createElement('div');
        rgbDiv.className = 'space-y-1';
        
        const rgbInputs = document.createElement('div');
        rgbInputs.className = 'flex gap-1 ml-16';
        rgbInputs.innerHTML = `
            <input type="number" min="0" max="255" value="${block.customRGB[paramName].r}" placeholder="R" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-r">
            <input type="number" min="0" max="255" value="${block.customRGB[paramName].g}" placeholder="G" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-g">
            <input type="number" min="0" max="255" value="${block.customRGB[paramName].b}" placeholder="B" class="w-14 px-1 py-0.5 rounded text-black text-xs rgb-b">
        `;
        rgbInputs.querySelector('.rgb-r').addEventListener('input', (e) => updateCustomRGB(block.id, paramName, 'r', e.target.value));
        rgbInputs.querySelector('.rgb-g').addEventListener('input', (e) => updateCustomRGB(block.id, paramName, 'g', e.target.value));
        rgbInputs.querySelector('.rgb-b').addEventListener('input', (e) => updateCustomRGB(block.id, paramName, 'b', e.target.value));
        rgbDiv.appendChild(rgbInputs);
        
        if (paramName === 'color') {
            const alphaInput = document.createElement('div');
            alphaInput.className = 'flex items-center gap-1.5 ml-16';
            alphaInput.innerHTML = `
                <label class="text-xs w-12 flex-shrink-0">alpha:</label>
                <input type="text" value="${block.params.alpha ? block.params.alpha.value : '1.0'}" placeholder="0.0-1.0" class="w-20 px-1.5 py-0.5 rounded text-black text-xs alpha-input">
            `;
            alphaInput.querySelector('.alpha-input').addEventListener('input', (e) => {
                if (!block.params.alpha) {
                    block.params.alpha = { value: '1.0', type: 'text' };
                }
                updateBlockParam(block.id, 'alpha', e.target.value);
            });
            rgbDiv.appendChild(alphaInput);
        }
        
        colorDiv.appendChild(rgbDiv);
    }
    
    return colorDiv;
}

function createDataSlot(block, slotType, placeholder) {
    const slotDiv = document.createElement('div');
    slotDiv.className = 'flex items-center gap-1.5';
    
    const label = document.createElement('label');
    label.className = 'text-xs w-12 flex-shrink-0';
    label.textContent = slotType + ':';
    
    const dropZone = document.createElement('div');
    dropZone.className = 'bg-white bg-opacity-30 rounded border-2 border-dashed border-white border-opacity-50 p-1.5 flex items-center justify-center min-h-8 flex-1 drop-zone';
    
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
    
    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        if (draggedListRef) {
            addDropZoneHighlight(dropZone);
        }
    });
    
    dropZone.addEventListener('dragleave', (e) => {
        removeDropZoneHighlight(dropZone);
    });
    
    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        removeDropZoneHighlight(dropZone);
        if (draggedListRef) {
            setDataSlot(block.id, slotType, draggedListRef);
            draggedListRef = null;
        }
    });
    
    slotDiv.appendChild(label);
    slotDiv.appendChild(dropZone);
    
    return slotDiv;
}

function createMultiDataSlot(block, dataSetIndex, slotType, label, placeholder) {
    const slotDiv = document.createElement('div');
    slotDiv.className = 'flex items-center gap-1.5';
    
    const labelEl = document.createElement('label');
    labelEl.className = 'text-xs w-8 flex-shrink-0';
    labelEl.textContent = label + ':';
    
    const dropZone = document.createElement('div');
    dropZone.className = 'bg-white bg-opacity-30 rounded border-2 border-dashed border-white border-opacity-50 p-1.5 flex items-center justify-center min-h-8 flex-1 drop-zone';
    
    const slotValue = block.dataSets[dataSetIndex][slotType];
    
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
        dropZone.querySelector('.remove-slot').addEventListener('click', () => removeDataSetSlot(block.id, dataSetIndex, slotType));
    }
    
    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        if (draggedListRef) {
            addDropZoneHighlight(dropZone);
        }
    });
    
    dropZone.addEventListener('dragleave', (e) => {
        removeDropZoneHighlight(dropZone);
    });
    
    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        removeDropZoneHighlight(dropZone);
        if (draggedListRef) {
            setDataSetSlot(block.id, dataSetIndex, slotType, draggedListRef);
            draggedListRef = null;
        }
    });
    
    slotDiv.appendChild(labelEl);
    slotDiv.appendChild(dropZone);
    
    return slotDiv;
}

function createLabelSlot(parentBlock, slotType, placeholder) {
    const dropZone = document.createElement('div');
    dropZone.className = 'bg-white bg-opacity-20 rounded border-2 border-dashed border-white border-opacity-40 p-2 flex items-center justify-center drop-zone';
    
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
    
    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        if (draggedBlock && draggedBlock.id === slotType) {
            addDropZoneHighlight(dropZone);
        }
    });
    
    dropZone.addEventListener('dragleave', (e) => {
        removeDropZoneHighlight(dropZone);
    });
    
    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        removeDropZoneHighlight(dropZone);
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
    workspace.addEventListener('dragover', (e) => {
        e.preventDefault();
        if (draggedBlock && (draggedBlock.id === 'figure' || draggedBlock.id === 'list')) {
            workspace.style.backgroundColor = '#e5e7eb';
        }
    });
    
    workspace.addEventListener('dragleave', (e) => {
        workspace.style.backgroundColor = '';
    });
    
    workspace.addEventListener('drop', (e) => {
        e.preventDefault();
        workspace.style.backgroundColor = '';
        if (draggedBlock && (draggedBlock.id === 'figure' || draggedBlock.id === 'list')) {
            createBlock(draggedBlock);
            draggedBlock = null;
        }
    });
}

document.addEventListener('DOMContentLoaded', init);