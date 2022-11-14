import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { VariacaoAtivoModel } from 'src/models/variacao.ativo.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Desafio Guideti';
  variacoes: VariacaoAtivoModel[] = [];

  constructor(private http: HttpClient) {
  }

  onAtivoSearch(search: { nome_ativo: string}) {
    console.log(search.nome_ativo)
    this.http.post('http://localhost:3000/api/v1/ativos/' + search.nome_ativo, null)
             .subscribe((res) => {
              console.log(res)
             });
  }
}