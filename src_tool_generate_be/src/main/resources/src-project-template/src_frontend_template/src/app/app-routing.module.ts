import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';

import {AuthGuard} from './core/guards/auth.guard';
import {LayoutComponent} from "./core/ui/layouts/layout.component";
import {Page404Component} from "./core/ui/extrapages/page404/page404.component";

const routes: Routes = [
  {path: 'auth', loadChildren: () => import('./core/ui/account/account.module').then(m => m.AccountModule)},
  {
    path: '',
    component: LayoutComponent,
    loadChildren: () => import('./pages/pages.module').then(m => m.PagesModule),
    canActivate: [AuthGuard]
  },
  {
    path: 'pages',
    loadChildren: () => import('./core/ui/extrapages/extrapages.module').then(m => m.ExtrapagesModule),
    canActivate: [AuthGuard]
  },
  {path: '**', component: Page404Component},
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {scrollPositionRestoration: 'top'})],
  exports: [RouterModule]
})

export class AppRoutingModule {
}
