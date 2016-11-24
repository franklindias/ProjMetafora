<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Professor . Módulo Pessoal</title>
<meta name="layout" content="public" />
</head>
<body>

	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table><br>");  

  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir este Professor?");

        if (resposta == true){
        location.href="/projetoMetafora/professor/deletar/"+id }

       }
 </script>
	<section class="content-header">
		<h1>
			Professores <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Professor" action="listar">Professores</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content">
		<div>
			<g:if test="${ok}">
				<div class="alert alert-success">
					${ok}
				</div>
			</g:if>
			<g:if test="${erro}">
				<div class="alert alert-danger">
					${erro}
				</div>
			</g:if>
			<div class="box box-white">

				<g:form controller="Professor" action="pesquisarProfessores"
					class="form" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputPesquisa" class="col-sm-2 control-label">NOME:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="" />
							<button style="margin-left: 36%; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="fa fa-save"></i> Buscar
							</button>
						</div>
					</div>
				</g:form>
				<table id="listarProfessor"
					class="table table-striped table-hover example">
					<g:if test="${!professores?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 65px;"></th>
							<th style="width: 280px; text-align: left;">Nome</th>
							<th style="width: 60px; text-align: left;">CPF</th>
							<th style="text-align: left;">Matricula</th>
							<th style="text-align: left;">Data de Nascimento</th>
							<th style="text-align: left;">Sexo</th>
							<th style="text-align: left;">Estado Civil</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${professores?}'>
							<g:set var="pessoa"
								value="${it.funcionario.cidadao.pessoaFisica.pessoa}" />
							<g:set var="funcionario" value="${it.funcionario }" />
							<g:set var="pessoaFisica"
								value="${it.funcionario.cidadao.pessoaFisica}" />
							<g:set var="cidadao" value="${it.funcionario.cidadao}" />
							<tr class='linha_registro'>
								<td>
									<div class="opcoes">
										<div style="display: inline">

											<g:if test="${perm2}">
												<div title="Editar Professor"
													class="btn btn-primary btn-xs btn-flat">
													<a style="color: #fff"
														href="/projetoMetafora/professor/editarProfessor/${pessoa.id}"><span
														class="glyphicon glyphicon-pencil"></span></a>
												</div>
												<div title="Remover Professor"
													onclick="deletar(${pessoa.id})"
													class="btn btn-danger btn-xs btn-flat">
													<span class="glyphicon glyphicon-remove"></span>
												</div>
											</g:if>

											<div title="ver detalhes do professor"
												class="btn btn-success btn-xs btn-flat">
												<a style="color: #fff"
													href="/projetoMetafora/professor/verInfoProfessor/${pessoa.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a>
											</div>
										</div>
									</div>
								</td>
								<td>
									${pessoa.nome}
								</td>
								<td>
									${pessoa.cpfCnpj}
								</td>
								<td>
									${funcionario.matricula}
								</td>
								<td><g:formatDate format="dd/MM/yyyy"
										date="${pessoa.dataDeNascimento}" /></td>
								<td>
									${pessoaFisica.sexo}
								</td>
								<td>
									${cidadao.estadoCivil}
								</td>
							</tr>
						</g:each>

					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			<g:if test="${perm2}">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal">
					<i class="fa fa-plus"></i> Novo Professor
				</button>
				<button class="btn btn-success btn-flat" data-toggle="modal"
					data-target="#myModalVinculo">
					<i class="fa fa-plus"></i> Importar e vincular professor
				</button>
			</g:if>

			<button class="btn btn-danger btn-flat"
				onClick="printDiv('listarProfessor')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			<!-- Modal vincular professor -->
			<div class="modal fade" id="myModalVinculo" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Vinculo de
								professor</h4>

						</div>
						<div class="modal-body" style="height: 400px;">
							<g:form controller="Professor" action="vincularProfessor" class="form"
								enctype="multipart/form-data">

								<div class="form-heading">
									<label>Professores</label> 
								
									<select style="height: 130px;"
										name="prof" class="form-control selectpicker" 
										style="border-radius: 0 !important;" data-live-search="true"
										required="required">
										<g:each in="${todosProfessor?}" var="t">
											<option value="${t.id}">
												${t.nome} 
											</option>
										</g:each>
									</select>
								</div>
								<div class="modal-footer">
								<button type="submit" class="btn btn-primary btn-flat">
									<i class="fa fa-save"></i> Cadastrar
								</button>
							</div>
							</g:form>
							


						</div>
					</div>
				</div>

			</div>

			<!-- Modal cadastrar professor -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de
								Professor</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Professor" action="salvar" class="form"
								enctype="multipart/form-data">

								<div class="form-heading">
									<label>Nome</label>
									<div class="controls">
										<g:textField class="form-control" required="true" name="nome"
											value="" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Data de Nascimento</label>
									<div class="controls">
										<g:formatDate format="yyyy-MM-dd" date="${date}" />
										<g:datePicker noSelection="['':'']" precision="day"
											class="form-control" required="true" name="dataDeNascimento"
											value="" />

									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>CPF</label>
									<div class="controls">
										<g:textField class="form-control" required="true" id="cpf"
											name="cpfCnpj" value="" />
									</div>
								</div>
								<br>
								<!--					<div class="form-heading">
										<label>Número do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNumero" value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nome do Cartório do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNomeDoCartorio"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nome do Livro do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNomeDoLivro"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Folha do Livro do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcFolhaDoLivro"
												value="" />
										</div>
										<br> -->
								<div class="form-heading">
									<label>Sexo</label>
									<div class="controls">
										<label class="radio-inline"> <input type="radio"
											name="sexo" id="inlineRadio1" value="MASCULINO">
											MASCULINO
										</label> <label class="radio-inline"> <input type="radio"
											name="sexo" id="inlineRadio2" value="FEMININO">
											FEMININO
										</label>
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Nacionalidade</label>
									<div class="controls">
										<g:textField class="form-control" required="true"
											name="nacionalidade" value="" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Estado Civil</label>
									<div class="controls">
										<select class="form-control" name="estadoCivil">
											<option value="null">Selecione...</option>
											<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
											<option value="CASADO(A)">CASADO(A)</option>
											<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
											<option value="VIÚVO(A)">VIÚVO(A)</option>
										</select>
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Profissão</label>
									<div class="controls">
										<g:textField class="form-control" required="true"
											name="profissao" value="" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Carga Horária</label>
									<div class="controls">
										<g:textField class="form-control" required=""
											name="cargaHoraria" value="" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Matricula</label>
									<div class="controls">
										<g:textField class="form-control" required="true"
											name="matricula" value="" />
									</div>
								</div>

								<br>

								<div class="form-heading">
									<label>Disciplinas</label>
									<div class="controls">
										<g:select class="form-control selectpicker"
											data-live-search="true" name="disciplinaProf"
											multiple="multiple"
											from="${br.gov.rn.saogoncalo.academico.Disciplina.list()}"
											value="${id}" optionKey="id" optionValue="disciplina" />
									</div>
								</div>
								<br>

								<script type="text/javascript">  
								function limparCampoFile1(){
									document.getElementById("documentos[]").value = "";
								}
								
								 $(document).ready(function(){  
								 
								    var input = '<label style="display: block"> <input type = "file" name ="documentos[]" id="documentos[]" enctype="multipart/form-data"/> <a href="#" class="remove">Excluir</a></label>';  
								    $("input[name='addFile1']").click(function(e){  
								        $('#inputs_adicionais').append( input );  
								    });  
								 
								    $('#inputs_adicionais').delegate('a','click',function(e){  
								        e.preventDefault();  
								        $(this).parent('label').remove();  
								    });  
								 
					                }); 
							</script>

								<label style="display: block"><input type="button"
									name="addFile1" value="Novo Documento" /></label>

								<label style="display: block"><input type="file"
									name="documentos[]" id="documentos[]"
									formenctype="multipart/form-data" /> <input type="button"
									name="limpar" value="Limpar" onclick="limparCampoFile()">
								</label>

								<fieldset id="inputs_adicionais" style="border: none">
								</fieldset>

								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
								</div>

							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
