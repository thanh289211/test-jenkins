import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ${pascalCaseName} } from '../model/${snakeCaseName}';
import { PageRequest, ResponseData, SearchRequest } from '../../../../core/shared/shared-model/shared-model';

@Injectable({
providedIn: 'root'
})
export class ${pascalCaseName}Service {
private apiUrl = environment.firebaseConfig.apiKey;
private entityApi = '/${snakeCaseName}';
private formValue: ${pascalCaseName};

constructor(private http: HttpClient) { }

getList(pageRequest: PageRequest): Observable<ResponseData> {
    const url = this.apiUrl + this.entityApi + '?pageNumber=' + pageRequest.pageNumber + '&pageSize=' + pageRequest.pageSize
    return this.http.get<ResponseData>(url);
        }

        delete(id: number): Observable<ResponseData> {
            return this.http.delete<ResponseData>(this.apiUrl + this.entityApi + '/' + id);
                }

                add(data: ${pascalCaseName}): Observable<ResponseData> {
                    return this.http.post<ResponseData>(this.apiUrl + this.entityApi + '/', data);
                        }

                        update(data: ${pascalCaseName}): Observable<ResponseData> {
                            return this.http.put<ResponseData>(this.apiUrl + this.entityApi +'/'+ data.id, data);
                                }

                                search(searchRequest: SearchRequest): Observable<any> {
                                    return this.http.get<any>(this.apiUrl + this.entityApi + '/search?pageNumber=' + searchRequest.pageNumber + '&pageSize=' + searchRequest.pageSize + '&value=' + searchRequest.value);
                                        }

                                        setFormValue(formValue: any){
                                        this.formValue = formValue;
                                        }

                                        getFormValue(){
                                        return this.formValue;
                                        }

                                        }
