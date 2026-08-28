## Correção de Erros no CRUD 
1° Erro:  
Local: servidor/server.js  
Linhas 59 - 61   
Foi passado apenas a resposta (res), que foi passado como único argumento. Consequentemente a variável (req) não existe (undefined). Ao tentar ler req.body, o Node.js lançará um erro travando a requisição do servidor.   
  
2° Erro:   
Local: servidor/server.js  
Linhas 63 - 65  
A rota insere o aluno no banco de dados, mas nunca envia uma resposta HTTP de volta ao cliente. Isso faz com que a requisição feita pelo Axios no React fique na espera até estourar o timeout.   
  
3° Erro:  
Local: servidor/server.js  
Linha 2  
A função express() cria a instância da aplicação e não recebe a string ‘express’.  
  
4° Erro:  
Local: client/src/components/CadastroAluno.js  
Linha 24 e 41  
O formulário chama a função handleClickButton no seu onSubmit. Mas como a função não recebe um evento e nem o chama, o navegador executa o comportamento padrão do HTML de recarregar a página imediatamente. Isso cancela ou interrompe a chamada assíncrona do Axios.post.  
  
5° Erro:  
Local: client/src/components/CadastroAluno.js  
Linha 40  
No react, a palavra reservada é className. Usar class gera um aviso de erro no console do navegador. Além disso, as classes bg-primary e p-3/p-4 estão duplicadas na mesma tag.  
  
6° Erro:  
Local: client/src/components/ListaAlunos.js  
Linha 71  
Usar index do array como key em listas onde elementos são excluídos ou editados pode causar problemas de sincronização no DOM virtual do react. Usar aluno.id.  
  
## Observações e Melhorias  
1° Observação:  
Local: client/src/components;CadastroAluno.js  
Linha 8 - 9  
Os estados nome e idade são instanciados mas nunca lidos, pois o formulário utiliza apenas a chave de objeto values. Linhas de código desnecessárias (foram retiradas).  
 const [nome, setNome] = useState('');  
 const [idade, setIdade] = useState('');  
  
2° Observação (p/ melhoria):   
Local: Comunicação entre CadastroAlunos.js e ListaAlunos.js em App.js  
Os componentes de cadastro e listagem funcionam de forma isolada. Quando um aluno novo é cadastrado com sucesso, a lista em LIstaAlunos não é atualizada automaticamente, tendo que exigir que o usuário recarregue a página manualmente.  
  
3° Observação (p/melhoria):   
Local: client/src/components/ListaAlunos.js  
Quando o usuário clica no botão Editar, o item entra em modo de edição. Se o usuário desistir de alterar, não existe um botão “Cancelar” para resetar o estado editingAluno de volta para o null.  
Criando a função ( Linha 64 )   
// Função para cancelar a edição  
 const handleCancelClick = () => {  
   setEditingAluno(null);  
   setEditedData({ nome: '', idade: '' });  
 };  
  
Incluindo um botão para cancelar a edição.   
//Logo após o botão salvar  
<button className="btn btn-secondary btn-sm ms-2" onClick={handleCancelClick}>  
Cancelar  
</button>  
