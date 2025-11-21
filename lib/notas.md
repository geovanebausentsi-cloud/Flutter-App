----------------------------------------------------------------------------
Para voltar a trabalhar em um branch diferente:

Primeiro, você pode listar todos os branches disponíveis em seu repositório local com o comando:

$ git branch

Para mudar de branch:
$ git checkout <nome-do-branch>

Move seu ambiente de trabalho (os arquivos do seu projeto) para o estado do último nó (commit) apontado por aquela branch.


para atualizar as pastas de acordo com o repositório
$ git pull origim <nome-do-branch>

--------------------------------------------------------------
Nó (Node/Commit): Pense em um "nó" como um commit específico. É um ponto único na história do seu projeto, como uma "foto" salva do seu código em um determinado momento. O histórico do seu projeto é uma sequência desses nós (commits).

Branch: Uma "branch" é essencialmente um ponteiro que aponta para um desses nós (commits). Ela representa uma linha de desenvolvimento. Quando você cria uma nova branch, você está criando um novo ponteiro para o commit atual, permitindo que você trabalhe em uma nova funcionalidade sem afetar a linha de desenvolvimento principal (como a branch main).

-------------------
crianndo uma nova branch
    git branch semana11

flutterapp-65657694:~/myapp{are}$  git branch semana11
flutterapp-65657694:~/myapp{semana10}$ git checkout semana11
Switched to branch 'semana11'