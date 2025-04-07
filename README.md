# Análise de Dados do E-commerce Olist
---
Este projeto tem como objetivo analisar os dados do e-commerce Olist para obter insights sobre o desempenho de vendas, comportamento dos clientes e eficiência operacional. Utilizando SQL, foram respondidas questões estratégicas que auxiliam na tomada de decisão.


---
📌 Observação: Para facilitar a visualização, os prints e tabelas apresentados neste projeto mostram apenas as 10 primeiras linhas dos resultados. As consultas completas foram executadas com base em todo o conjunto de dados disponível.

## 🧠 Perguntas Analisadas

### 1. Os clientes novos estão voltando para comprar novamente?

**Propósito:** Medir retenção e lealdade dos clientes.  
**Metodologia:**
- Identificação de clientes únicos no banco de dados.
- Contagem de clientes que realizaram mais de uma compra.
- Cálculo da taxa de retenção.

**Resultados:**
- Nenhum dos clientes voltou a comprar.

![retencao dos clientes](https://github.com/user-attachments/assets/c1ef377e-d736-4e03-82af-de1ecfe8c907)


### 2. Nosso faturamento está crescendo ou caindo? Como foi a evolução nos últimos 12 meses?

**Propósito:** Entender a tendência de receita ao longo do tempo.  
**Metodologia:**
- Soma das vendas agrupadas por mês.
- Análise comparativa com os meses anteriores.
- Cálculo da variação percentual mês a mês.

**Resultados:**
- O faturamento apresentou queda de 99,4% nos últimos 12 meses.


![faturamento caindo ou crescendo-resultado-top10](https://github.com/user-attachments/assets/c8d1dca5-1cea-4fd5-a7cf-78850b741f96)

---

### 3. Há sazonalidade nas vendas? Em quais períodos vendemos mais e menos?

**Propósito:** Identificar padrões de alta e baixa demanda foi analisado o faturamento.  
**Metodologia:**
- Agregação das vendas por mês.
- Análise de tendências anuais.
- Identificação de picos sazonais.

**Resultados:**
- O pico de vendas ocorre nos meses de **Maio** e **Agosto**.
- A queda ocorre nos meses de **Setembro** e **Outubro**.

![sazonalidade venda](https://github.com/user-attachments/assets/27224e60-e088-4e40-ad12-e2a09c187aee)


### 4. Quais categorias de produto vendem mais e quais estão com vendas fracas?

**Propósito:** Direcionar esforços para produtos mais rentáveis.  
**Metodologia:**
- Cálculo da receita por categoria.
- Identificação de categorias com menor volume de vendas.

**Resultados:**
- As categorias mais lucrativas são **utilidades domésticas**, **bebês**, **cool_stuff**.
- A categoria com menor desempenho é **seguros e serviços**.

![categoria + faturamento](https://github.com/user-attachments/assets/a5650896-ad76-4e24-932e-a71c05619521)

---

### 5. Quais produtos mais vendidos têm baixa avaliação? Isso pode indicar problemas de qualidade?

**Propósito:** Relacionar vendas e satisfação do cliente.  
**Metodologia:**
- Identificação dos produtos mais vendidos.
- Cálculo da média das avaliações para esses produtos.
- Ranking dos produtos mais vendidos com notas abaixo de 3.5.
- Produtos que tenham sido vendidos mais de uma vez

**Resultados:**
- Os produtos `31a89a7044c5b133cf646404a4e86022` (utilidades domésticas), `1d1fc8a85e598b6b83a558fbd354443d` (instrumentos musicais) e `c45d02cc82cd779835094de9b29272cb` (cama mesa banho) são os mais vendidos com baixa avaliação.
- A categoria que mais se repete é **esporte lazer**.
- Isso pode indicar **problemas de qualidade** ou **expectativas não atendidas**.
- O dataset utilizado **não possui o nome dos produtos **

![produtos mais vendidos com avaliacoes baixar](https://github.com/user-attachments/assets/ea550fd9-9ca7-4045-806e-e073acf7f9d6)


### 6. Quais estados mais atrasam na entrega? Isso pode impactar a satisfação dos clientes?

**Propósito:** Avaliar gargalos logísticos e impacto na satisfação do cliente.  
**Metodologia:**
- Cálculo do tempo médio de entrega por estado.
- Correlação com a média das avaliações.

**Resultados:**
- O estado com maior atraso é a **Bahia**.
- A **Bahia** apresenta um alto tempo médio de atraso (**3 dias**) e a pior avaliação dos clientes (**1.0**).

![atraso por estado](https://github.com/user-attachments/assets/f6e6577d-fcfd-43aa-8233-f4272b9a65a1)


### 7. Estamos perdendo vendas por cancelamentos? Como essa taxa mudou ao longo do tempo?

**Propósito:** Avaliar impacto financeiro dos cancelamentos e possíveis causas.  
**Metodologia:**
- Análise da taxa de cancelamento mensal.
- Identificação de padrões e possíveis causas.

**Resultados:**
- A taxa média de cancelamento é de **4,92%**.
- Nos últimos meses, houve um aumento de **92,06 p.p.**, saltando de **0,18% (2017-12)** para **100% (2018-09 e 2018-10)**.

![% cancelamento](https://github.com/user-attachments/assets/7ad0c18f-26a1-4abf-9bba-c6902fb50f7f)

---

### Conclusão

Com base nos insights obtidos, algumas ações podem ser implementadas para otimizar os resultados do e-commerce, como:

- Melhoria na logística.
- Estratégias para aumentar a retenção de clientes.
- Ajustes nas campanhas sazonais.

---

### Ferramentas Utilizadas
- **SQL**

Este projeto demonstra habilidades em **análise de dados aplicadas a cenários reais de e-commerce**, permitindo decisões mais informadas para o crescimento do negócio.

---

### Próximos Passos

📌 **Aplicar modelos estatísticos para previsão de vendas**  
→ Usar regressão linear ou séries temporais (ARIMA) para prever tendências futuras.

📌 **Analisar a relação entre atraso e avaliação**  
→ Testar correlação Spearman/Kendall para avaliar relações não lineares.

📌 **Implementar análise de outliers nos cancelamentos**  
→ Identificar meses atípicos usando Z-score ou IQR.

📌 **Criar dashboards interativos no Power BI**  
→ Visualizar sazonalidade, impacto dos atrasos e categorias mais lucrativas.

📌 **Comparar clusters de clientes**  
→ Aplicar segmentação (K-means) para entender perfis de compra e comportamento.

