## Why [Protocol Buffers](https://protobuf.dev/programming-guides/proto3/) (protobuf)?

[PROTOCOL BUFFERS](https://protobuf.dev/programming-guides/proto3/) (protobuf) are used as the foundation for generating schema files in Buf due to several key advantages they offer:

1. **Efficiency**: Protocol Buffers utilize a binary format, which is significantly more space and processing-efficient compared to text-based formats like JSON or XML. This efficiency is crucial for optimizing data transmission and storage, especially in distributed systems.

2. **Schema Evolution**: Protobuf supports versioning and evolution of message schemas, allowing for seamless updates to data structures without breaking backward compatibility. This flexibility is essential for evolving software systems over time while maintaining interoperability.

3. **Code Generation**: Buf leverages Protobuf's code generation capabilities to automatically generate source code in languages like Dart and TypeScript. This generated code provides type-safe representations of data structures, reducing manual coding efforts and improving code quality.

4. **Language Agnosticism**: Protobuf's language-agnostic nature enables developers to define data structures using a unified schema language and then generate code for multiple programming languages. This promotes consistency and interoperability across heterogeneous environments.

5. **Serialization and Deserialization**: Protobuf provides built-in support for efficient serialization and deserialization of structured data, ensuring fast and reliable data processing in distributed systems.

6. **Schema Validation**: Protobuf schemas offer a clear and structured definition of data models, facilitating schema validation during data serialization and deserialization. This helps catch data format errors early in the development lifecycle.

7. **Performance**: Due to its binary format and streamlined serialization/deserialization mechanisms, Protocol Buffers deliver superior performance in terms of data processing speed and network efficiency compared to text-based formats.

Certainly! Based on the link you provided from the Buf documentation, I'll describe what Buf is:

---

## [Why using Buf?](https://buf.build/docs/introduction)

[Buf](https://buf.build/docs/introduction) is a powerful tool designed for managing Protocol Buffers (protobuf) in modern software development workflows. It provides a comprehensive set of features and capabilities to streamline the management, validation, and generation of protobuf files. Here's an overview of what Buf offers:

### 1. **Schema Management**

Buf simplifies the management of protobuf schemas by providing tools to organize, version, and validate schema files. It allows developers to define structured data models using protobuf's schema language and ensures consistency and maintainability across projects.

### 2. **Linting and Code Style Enforcement**

With Buf, you can enforce coding standards and best practices for protobuf files through linting rules. This helps maintain clean, readable, and standardized codebases, leading to improved code quality and collaboration.

### 3. **Dependency Management**

Buf facilitates dependency management for protobuf files by allowing you to specify and manage dependencies between different protobuf files and external repositories. This ensures that changes in dependencies are tracked and managed effectively.

### 4. **Schema Versioning and Evolution**

Buf supports versioning and evolution of protobuf schemas, enabling developers to make changes to data structures while ensuring backward compatibility. This helps in evolving software systems over time without disrupting existing integrations.

### 5. **Code Generation**

One of Buf's key features is its code generation capabilities. It can automatically generate source code in various programming languages (such as Go, Java, Python, etc.) based on protobuf definitions. This eliminates manual code writing and ensures type-safe interactions between components.

### 6. **Integration with Build Systems**

Buf seamlessly integrates with popular build systems and continuous integration (CI) pipelines, allowing for automated validation, linting, and code generation processes. This integration enhances development workflows and promotes consistency across development environments.

### 7. **Extensibility and Customization**

Buf is highly extensible and customizable, allowing developers to create custom plugins, linting rules, and code generation templates tailored to their specific project requirements. This flexibility empowers teams to adapt Buf to their unique development workflows.

## Installation

- Homebrew

```bash
 brew install bufbuild/buf/buf
```

- NPM

```bash
 npm install @bufbuild/buf
```

- Windows

```bash
 scoop install buf
```

- Linux

```bash
  mkdir -p ~/.local/bin
  curl -L --progress-bar https://github.com/bufbuild/buf/releases/latest/download/buf-Linux-x86_64 -o ~/.local/bin/buf
  chmod +x ~/.local/bin/buf
```

- GO
```bash
  go install github.com/bufbuild/buf/cmd/buf@latest
```

## Before you begin

Let's check the version of buf you'll be using is up-to-date.

```bash
$ buf --version
Output
1.57.0
```

## Generates schema model
1. prerequise:
- run `buf dep update` to get buf deps like proto validate.
- install `yq` v4+ used to merge openapi generated model:
```bash
curl -L --progress-bar https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o ~/.local/bin/yq 
chmod +x ~/.local/bin/yq
```

2. generate models `./scripts/generate.sh`