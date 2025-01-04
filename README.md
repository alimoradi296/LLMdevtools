# LLMDevTools 🤖

> ⚠️ **Work in Progress**: This repository is actively being developed. Features and documentation are being continuously added and improved. for now i just added bash script that combines js files inside a folder into a single file to pass the number of file challenge .
 
A comprehensive toolkit for LLM-powered development workflows and code generation. This repository provides a collection of tools and utilities to automate coding tasks, manage file operations, and integrate LLM capabilities into your development process.


## 🚧 Development Status

This project is in active development. Here's what's currently being worked on:

- [ ] Basic repository structure
- [x] JavaScript file combination utilities
- [ ] anycode file combination utilities
- [ ] Python code generation tools
- [ ] System integration utilities
- [ ] Documentation and examples
- [ ] Testing framework
- [ ] CI/CD pipeline

## 🌟 Features

- **File Management Scripts**: Automated scripts for file operations and code organization
- **Code Generation Tools**: Python utilities for LLM-based code generation
- **System Integration**: Tools to automatically integrate generated code into your system
- **Development Utilities**: Development server and testing utilities
- **Custom Prompts**: Library of optimized prompts for different coding tasks

## 📁 Repository Structure

```
llm-dev-tools/
├── scripts/
│   ├── file_ops/
│   │   ├── combine_js.sh        # JavaScript file combiner
│   │   ├── combine_py.sh        # Python file combiner
│   │   └── file_utils.sh        # Common file operations
│   └── setup/
│       ├── init_project.sh      # Project initialization
│       └── install_deps.sh      # Dependencies installation
├── src/
│   ├── generators/
│   │   ├── code_gen.py         # Main code generation logic
│   │   ├── prompt_builder.py   # Dynamic prompt construction
│   │   └── templates/          # Code templates
│   ├── integrators/
│   │   ├── system_integrator.py # System integration logic
│   │   └── validators.py       # Code validation utilities
│   └── utils/
│       ├── llm_utils.py        # LLM interaction utilities
│       └── file_handlers.py    # File handling utilities
├── config/
│   ├── llm_config.yaml        # LLM configuration
│   └── prompts/
│       ├── python_prompts.yaml
│       ├── js_prompts.yaml
│       └── bash_prompts.yaml
├── tests/
│   ├── test_generators/
│   ├── test_integrators/
│   └── test_utils/
├── examples/
│   ├── code_generation/
│   ├── file_operations/
│   └── system_integration/
├── docs/
│   ├── API.md
│   ├── CONTRIBUTING.md
│   └── guides/
│       ├── getting_started.md
│       └── advanced_usage.md
├── .gitignore
├── requirements.txt
├── setup.py
└── README.md
```

## 🚀 Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/llm-dev-tools.git
cd llm-dev-tools
```

2. Install dependencies:
```bash
./scripts/setup/install_deps.sh
```

3. Configure your LLM settings in `config/llm_config.yaml`

4. Run the initialization script:
```bash
./scripts/setup/init_project.sh
```

## 📖 Usage Examples

### Combining JavaScript Files
```bash
./scripts/file_ops/combine_js.sh src/js-files output.js
```

### Generating Code with LLM
```python
from src.generators.code_gen import generate_code

# Generate a Python function
code = generate_code(
    task="Create a function to process JSON data",
    language="python",
    template="data_processing"
)
```

### System Integration
```python
from src.integrators.system_integrator import integrate_code

# Integrate generated code into your system
integrate_code(
    code_content=generated_code,
    target_path="./my_project/utils/",
    validation_level="strict"
)
```

## 🛠️ Core Components

### 1. File Operations (`scripts/file_ops/`)
- Bash scripts for file management and combination
- Utilities for code organization and cleanup

### 2. Code Generators (`src/generators/`)
- LLM-powered code generation utilities
- Template-based code generation
- Dynamic prompt construction

### 3. System Integrators (`src/integrators/`)
- Tools for integrating generated code
- Validation and safety checks
- System compatibility verification

### 4. Configuration (`config/`)
- LLM settings and configurations
- Customizable prompts for different languages
- System integration rules

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guidelines](docs/CONTRIBUTING.md) for details on how to submit pull requests, report issues, and contribute to the project.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


