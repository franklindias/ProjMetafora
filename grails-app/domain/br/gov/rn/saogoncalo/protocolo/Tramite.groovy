package br.gov.rn.saogoncalo.protocolo



class Tramite {
	
	Date dataDisponibilizacao
	Date dataRecebimento
	FuncionarioSetor funcionarioSetorOrigem
	FuncionarioSetor funcionarioSetorDestino

	static belongsTo = [protocolo:Protocolo]
	
	static constraints = {
		dataDisponibilizacao blank:false, nullable:true
		dataRecebimento blank:false, nullable:true
		
	}
	
	static mapping = {
		table name: "Tramite", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.tramite_id_seq']
	}
}