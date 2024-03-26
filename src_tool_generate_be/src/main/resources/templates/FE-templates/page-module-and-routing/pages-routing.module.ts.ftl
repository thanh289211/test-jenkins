import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DefaultComponent } from './dashboards/default/default.component';

<#list entities as entity>
    import { List${entity.pascalCaseName}Component } from './components/${entity.snakeCaseName}/component/list/list-${entity.snakeCaseName}.component';
</#list>

const routes: Routes = [
{
path: "",
component: DefaultComponent
},
{ path: 'dashboard', component: DefaultComponent },
{ path: 'dashboards', loadChildren: () => import('./dashboards/dashboards.module').then(m => m.DashboardsModule) },
<#list entities as entity>
    {
    path: '${entity.snakeCaseName}',
    component: List${entity.pascalCaseName}Component
    },
</#list>
];

@NgModule({
imports: [RouterModule.forChild(routes)],
exports: [RouterModule]
})
export class PagesRoutingModule { }
