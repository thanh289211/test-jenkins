import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DefaultComponent } from './dashboards/default/default.component';

    import { ListUserEntityComponent } from './components/user-entity/component/list/list-user-entity.component';

const routes: Routes = [
{
path: "",
component: DefaultComponent
},
{ path: 'dashboard', component: DefaultComponent },
{ path: 'dashboards', loadChildren: () => import('./dashboards/dashboards.module').then(m => m.DashboardsModule) },
    {
    path: 'user-entity',
    component: ListUserEntityComponent
    },
];

@NgModule({
imports: [RouterModule.forChild(routes)],
exports: [RouterModule]
})
export class PagesRoutingModule { }
