import { NgModule, Component } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Import Containers
import { DefaultLayoutComponent } from './containers';

import { P404Component } from './views/error/404.component';
import { P500Component } from './views/error/500.component';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';
import { StudentComponent } from './views/student/student.component';
import { OrderComponent } from './views/order/order.component';
import { CourseComponent } from './views/course/course.component';
import { TableComponent } from './views/table/table.component';
import { SupplierComponent } from './views/supplier/supplier.component';
import { EmployeeComponent } from './views/employee/employee.component';
import { IngredientsComponent } from './views/ingredients/ingredients.component';
import { StockOrderComponent } from './views/stock-order/stock-order.component';
import { ProductComponent } from './views/product/product.component';
import { DrinkComponent } from './views/drink/drink.component';
import { ReportComponent } from './views/report/report.component';
import { ReportQuantityComponent } from './views/report-quantity/report-quantity.component';
import { BillComponent } from './views/bill/bill.component';


export const routes: Routes = [
  {
    path: '',
    redirectTo: 'dashboard',
    pathMatch: 'full',
  },
  {
    path: '404',
    component: P404Component,
    data: {
      title: 'Page 404'
    }
  },
  {
    path: '500',
    component: P500Component,
    data: {
      title: 'Page 500'
    }
  },
  {
    path: 'login',
    component: LoginComponent,
    data: {
      title: 'Login Page'
    }
  },
  {
    path: 'register',
    component: RegisterComponent,
    data: {
      title: 'Register Page'
    }
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Home'
    },
    children: [
      {
        path: 'student',
        component: StudentComponent
      },
      {
        path: 'product',
        component: ProductComponent
      },
      {
        path: 'order',
        component: OrderComponent
      },
      {
        path: 'table',
        component: TableComponent
      },
      {
        path: 'course',
        component: CourseComponent
      },
      {
        path: 'supplier',
        component: SupplierComponent
      },
      {
        path: 'employee',
        component: EmployeeComponent
      },
      {
        path: 'ingredients',
        component: IngredientsComponent
      },
      {
        path: 'stock_order',
        component: StockOrderComponent
      },
      {
        path: 'drink',
        component: DrinkComponent
      },
      {
        path: 'bill',
        component: BillComponent
      },
      {
        path: 'report',
        children: [
          {
            path: 'total',
            component: ReportComponent
          },
          {
            path: 'quantity',
            component: ReportQuantityComponent
          },
        ]
      },

      {
        path: 'base',
        loadChildren: './views/base/base.module#BaseModule'
      },
      {
        path: 'buttons',
        loadChildren: './views/buttons/buttons.module#ButtonsModule'
      },
      {
        path: 'charts',
        loadChildren: './views/chartjs/chartjs.module#ChartJSModule'
      },
      {
        path: 'dashboard',
        loadChildren: './views/dashboard/dashboard.module#DashboardModule'
      },
      {
        path: 'icons',
        loadChildren: './views/icons/icons.module#IconsModule'
      },
      {
        path: 'notifications',
        loadChildren: './views/notifications/notifications.module#NotificationsModule'
      },
      {
        path: 'theme',
        loadChildren: './views/theme/theme.module#ThemeModule'
      },
      {
        path: 'widgets',
        loadChildren: './views/widgets/widgets.module#WidgetsModule'
      }
    ]
  },
  { path: '**', component: P404Component }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
