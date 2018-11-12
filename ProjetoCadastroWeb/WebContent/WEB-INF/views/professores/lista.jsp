<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Cadastro FTI</title>
</head>
<body>
<h1>Lista de Professores</h1>
		<main>
			<table class="tabelaMain">
				<thead>
					<tr>
						<th>Cadastro</th>
						<th>Nome</th>
						<th>CPF</th>
						<th>Data de Nascimento</th>
						<th>Sexo</th>
						<th>Endere�o</th>
						<th>Disciplina</th>
						<th>Telefone</th>
						<th>E-mail</th>
						<th></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th colspan="10">
							<input class="button" type="button" onclick="location.href='cadastrarFuncionario'" value="Cadastrar novo Professor">
							<a href="/ProjetoCadastroWeb/"><button>Menu</button></a>
						</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${professores}" var="professor">
						<tr id="funcionario_${professor.cadastro}">
							<td>${professor.cadastro}</td>
							<td>${professor.nome}</td>
							<td>${professor.cpfFormatado}</td>
							<td><fmt:formatDate
									value="${professor.dataNascimento}"
									pattern="dd/MM/yyyy"/>
							</td>
							
								<c:if test="${professor.sexo == 'M'}">
								<td>Masculino</td>
								</c:if>
								<c:if test="${professor.sexo == 'F'}">
								<td>Feminino</td>
								</c:if>
							
							<td>${professor.endereco}</td>
							<td>${professor.disciplina}</td>
							<td>${professor.telefoneFormatado}</td>
							<td>${professor.email}</td>
							<td style="display: flex-box; flex-orientation: row;"><a href="mostraAluno?matricula=${professor.cadastro}"><i style="color: black; margin-left:2%;" class="material-icons">create</i></a> &nbsp
							<a href="removeTarefa?id=${professor.cadastro}"><i style="color: black;" class="material-icons">delete</i></a></td>
						</tr>
						<tr id="funcionario_${professor.cadastro}aux" class="auxTr">
							<td colspan="9">
								<div class="divAuxInfo">
									<table style="width: 100%;">
										<tr>
											<td> &nbsp</td>
										</tr>
										<tr>
											<th>Sal�rio</th>
											<th>Vale Transporte</th>
											<th>Vale Alimenta��o</th>
											<th>Vale Refei��o</th>
											<th>N� de Dependentes</th>
											<th>Cargo</th>
										</tr>
										<tr>
											<td>${professor.salarioFormatado}</td>
											<td>${professor.valeTransporteFormatado}</td>
											<td>${professor.valeAlimentacaoFormatado}</td>
											<td>${professor.valeRefeicaoFormatado}</td>
											<td>${professor.filhos}</td>
											<td>${funcionario.cargo}</td>
										</tr>
										
										<c:if test="${professor.filhos gt 0}">
											<tr>
												<td> &nbsp</td>
											</tr>
											<tr>
												<td colspan="6">
													<div class="divTabelaFilhos">
														<table style="width: 100%;">
															<tr>
																<th colspan="3">Filhos</th>
															</tr>
															<tr>
																<th></th>
																<th>Nome</th>
																<th>Data de Nascimento</th>
																<th></th>
															</tr>
															<c:set var="counter" value="1"/>
															<c:forEach items="${professor.listaFilhos}" var="filho">
																<tr>
																	<td style="text-align: right;">Filho ${counter}</td>
																	<td style="text-align: center;">${filho.nome}</td>
																	<td style="text-align: center;"><fmt:formatDate
																				value="${filho.dataNascimento}"
																				pattern="dd/MM/yyyy"/>
																	</td>
																</tr>
																	<c:set var="counter" value="${counter+1}"/>
																</c:forEach>
															</table>
														</div>
												</td>
											</tr>
										</c:if>
									</table>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(function(){
		$("td[colspan=9]").find(".divAuxInfo").hide();
		
		$(".tabelaMain").click(function(event){
			event.stopPropagation();
			
			var $target = $(event.target);
			
			if($target.closest("div").closest("tr").find("td").attr("colspan") > 8) {
				$target.closest("div").slideUp();
			} else { 
					$target.closest("tr").next().find(".divAuxInfo").slideToggle();
			}
		})
	})
	</script>
</html>