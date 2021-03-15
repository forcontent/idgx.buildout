# idgx.buildout

IDGX é uma versão independente da tradicional distribuição de Plone desenvolvida pelo Governo Federal e pela comunidade Plone. O Objetivo dessa versão independente é atualizar a versão do Plone para sua versão mais estável, resolvendo um grande problema de segurança da versão original, que é a utilização de uma versão antiga do Python.

## 1. Porque uma versão independente?

Apesar da versão anterior ser totalmente aberta para quem quiser contribuir, ela sempre seguiu regras e interface definidas por órgãos do governo. A ideia aqui é que os recursos e a interface sejam definidos pela comunidade e pelos patrocinadores do projeto. 

## 2. Recursos presentes

O IDGX conta com os seguintes complementos em sua instalação

* collective.cover
* collective.nitf
* collective.easyform
* brasilgov.tiles

## 3. Instalação

### 3.1 Desenvolvimento

Atualize o sistema com as dependencias necessárias. Na linha de comando rode:
```
$ sudo apt-get update && sudo apt-get install -y --no-install-recommends --no-install-suggests python3-setuptools python3-dev build-essential python3-cffi libpcre-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-dev libyaml-dev curl tzdata net-tools python3-venv
```
Para evitar conflitos com o Python utilizado pelo sistema operacional, cria-se um ambiente virtual (virtualenv) apartado do restante do sistema. Execute:
```
virtualenv -p python2.7 ./env27
```
Atenção: Por enquanto seguimos com Python 2.7 para agilizar o desenvolvimento. Quando finalizado, utilizaremos Python 3:
```
python3 -m venv env
```

Agora clone o projeto:
```
$ git clone https://github.com/forcontent/idgx.buildout.git
```
Ative o ambiente virtual:
```
$ source ./env/bin/activate
```
Aí para terminar, vá para a pasta onde o código do projeto foi clonado, instale os requerimentos e rode o buildout:
```
$ cd idgx.buildout
$ pip install -r requirements.txt
$ buildout -t 30 -c development.cfg
```
"Nada pode dar errado" :)

#### 3.1.1 Subindo a instancia
Para subir a instancia e iniciar o Plone rode: 
```
$ bin/instance fg
```
VOcê poderá acessar o Plone pelo endereço localhost:8080 em seu navegador


## 4. Patrocínio

O desenvolvimento desta distribuição do Plone foi feita pelas seguintes empresas:

* Colibrigov
* Forcontent | @forcontent

Caso queira participar do desenvolvimento, entre em contato.
