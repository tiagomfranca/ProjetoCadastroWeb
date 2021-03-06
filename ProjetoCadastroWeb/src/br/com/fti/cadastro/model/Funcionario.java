package br.com.fti.cadastro.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import br.com.fti.cadastro.controller.UtilController;

@Entity
@Table(name = "funcionarios")
public class Funcionario extends Pessoa {
	
	@Id
	@GeneratedValue
	@Column(name="codigo")
	private Long cadastro;
	
	@NotNull
	private String cargo;
	
	private String disciplina;
	
	@NotNull
	private BigDecimal salario;
	
	@Column(name="vale_alimentacao")
	BigDecimal valeAlimentacao;
	
	@Column(name="vale_transporte")
	BigDecimal valeTransporte;
	
	@Column(name="vale_refeicao")
	BigDecimal valeRefeicao;
	
	@Column(name="numero_filhos")
	private int filhos;
	
	@OneToMany(mappedBy = "funcionario", targetEntity = Filho.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Filho> listaFilhos;
	
	public Long getCadastro() {
		return cadastro;
	}
	
	public void setCadastro(Long cadastro) {
		this.cadastro = cadastro;
	}
	
	public String getCargo() {
		return cargo;
	}
	
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	
	public BigDecimal getSalario() {
		return salario;
	}
	
	public String getSalarioFormatado(){
		return UtilController.mascaraDinheiro(salario);
	}
	
	public void setSalario(String salario) {
		if(salario.contains(",")){
			salario = UtilController.removeMascaraDinheiro(salario);
		}
		this.salario = new BigDecimal(salario);
	}
	
	public BigDecimal getValeAlimentacao() {
		return valeAlimentacao;
	}
	
	public String getValeAlimentacaoFormatado() {
		return UtilController.mascaraDinheiro(valeAlimentacao);
	}
	
	public void setValeAlimentacao(String valeAlimentacao) {
		if(valeAlimentacao.contains(",")){
			valeAlimentacao = UtilController.removeMascaraDinheiro(valeAlimentacao);
		}
		this.valeAlimentacao = new BigDecimal(valeAlimentacao);
	}
	
	public BigDecimal getValeTransporte() {
		return valeTransporte;
	}
	
	public String getValeTransporteFormatado() {
		return UtilController.mascaraDinheiro(valeTransporte);
	}
	
	public void setValeTransporte(String valeTransporte) {
		if(valeTransporte.contains(",")){
			valeTransporte = UtilController.removeMascaraDinheiro(valeTransporte);
		}
		this.valeTransporte = new BigDecimal(valeTransporte);
	}
	
	public BigDecimal getValeRefeicao() {
		return valeRefeicao;
	}
	
	public String getValeRefeicaoFormatado() {
		return UtilController.mascaraDinheiro(valeRefeicao);
	}
	
	public void setValeRefeicao(String valeRefeicao) {
		if(valeRefeicao.contains(",")){
			valeRefeicao = UtilController.removeMascaraDinheiro(valeRefeicao);
		}
		this.valeRefeicao = new BigDecimal(valeRefeicao);
	}
	
	public int getFilhos() {
		return filhos;
	}
	
	public void setFilhos(int filhos) {
		this.filhos = filhos;
	}
	
	public List<Filho> getListaFilhos() {
		return listaFilhos;
	}
	
	public void setListaFilhos(List<Filho> listaFilhos) {
		this.listaFilhos = listaFilhos;
	}

	public String getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}

}
