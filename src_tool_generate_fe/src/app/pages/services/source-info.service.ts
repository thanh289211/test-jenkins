import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable';
import { SourceInfo } from '../models/source-info';

@Injectable({
  providedIn: 'root'
})
export class SourceInfoService {

  private apiUrl = "http://localhost:8888/api/project-generate";
  constructor(private http: HttpClient) { }

  generateFile(data: SourceInfo): Observable<HttpResponse<Blob>> {
    let headers = new HttpHeaders();
    headers = headers.append('Accept', 'application/zip');
 
    return this.http.post(this.apiUrl, data , {
      headers: headers,
      observe: 'response',
      responseType: 'blob'
    });
  }

}


