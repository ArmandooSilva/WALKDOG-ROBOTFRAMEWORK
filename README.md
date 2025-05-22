# 🚀 Automação de Testes - https://walkdog.vercel.app/

Este projeto tem como objetivo automatizar testes funcionais do site **https://walkdog.vercel.app/**, validando principalmente a funcionalidade de **cadastro de usuário**.


## 🛠️ Tecnologias e Ferramentas Utilizadas

- [Robot Framework](https://robotframework.org/)  
- [Robot Framework Browser (Playwright)](https://github.com/MarketSquare/robotframework-browser)  
- [Python 3.12](https://www.python.org/downloads/release/python-3120/)

  
## 📁 Estrutura das Pastas

📦 WALLKDOG-ROBOT
┣ 📂 tests/hello, home, sinup (.robot)
┣ 📂 resources/acitons/sinup
┣ 📂 results/browser/log.html
┣ 📜 README.md/WALLDOG-ROBOT

---

## 🧠 Cenários Testados
- ✅ Cadastro de usuário com sucesso
- ❌ Validação de cadastro sem sucesso, verificando campos obrigatórios

---

## ▶️ Como Executar

1. robot -d ./results ./tests/hello.robot
2. robot -d ./results ./tests/home.robot
3. robot -d ./results ./tests/sinup.robot

---
## 📜 Relatórios
Após a execução, os relatórios estarão na pasta /results:

1. log.html → Detalhes completos da execução.
2. report.html → Sumário dos testes.
3. playwright-log.txt
4. output.xml → Arquivo de saída.

---
### 🔹 1. Clone o repositório
```bash
git clone https://github.com/ArmandooSilva/WALKDOG-ROBOTFRAMEWORK/.git
cd WALKDOG-ROBOTFRAMEWORK
