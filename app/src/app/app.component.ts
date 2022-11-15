import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, Renderer2, ViewChild } from '@angular/core';
import { VariacaoAtivoModel } from 'src/models/variacao.ativo.model';
import { Chart } from 'chart.js';
import { ThisReceiver } from '@angular/compiler';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Desafio Guideti';
  variacoes: VariacaoAtivoModel[] = [];
  dataLabels: any = [];
  dataDayByDay: any = [];
  dataDayFromStart: any = [];
  lineChart: any;

  @ViewChild("myCanvas", { static: true }) elemento!: ElementRef;

  constructor(private http: HttpClient, private renderer: Renderer2) {
  }

  getGrafico() {
    this.populateData();
    if (this.lineChart != undefined) {
      this.lineChart.destroy();
    }

    this.lineChart = new Chart(this.elemento.nativeElement, {
      type: 'line',
      data: {
        labels: this.dataLabels,
        datasets: [
          {
            label: 'Variação % data anterior',
            data: this.dataDayByDay,
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            backgroundColor: 'rgb(75, 192, 192)',
            tension: 0.1
          },
          {
            label: 'Variação % primeira data',
            data: this.dataDayFromStart,
            fill: false,
            borderColor: 'rgb(192, 75, 192)',
            backgroundColor: 'rgb(192, 75, 192)',
            tension: 0.1
          },
        ]
      }
    });
  }

  populateData() {
    this.dataDayByDay = []
    this.dataDayFromStart = []
    this.dataLabels = []

    this.variacoes.forEach((variacao) => {
      this.dataLabels.push(new Date(variacao.data * 1000).toLocaleDateString("pt-BR"));
      this.dataDayByDay.push(variacao.d1_variation === null ? 0.0 : variacao.d1_variation);
      this.dataDayFromStart.push(variacao.begin_variation === null ? 0.0 : variacao.begin_variation);
    });
  }

  onAtivoSearch(search: { nome_ativo: string}) {
    this.http.post('http://localhost:3000/api/v1/ativos/' + search.nome_ativo, {})
                    .subscribe((res: any) => {
                      this.variacoes = res.data
                      this.getGrafico();
                    })
  }
}
