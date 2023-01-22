import { createRouter, createWebHashHistory } from "vue-router";
import HomePage from './components/HomePage'
import QueryPage from './components/QueryPage'
import AllDatabase from './components/AllDatabase'


const routes = [
    {
        path:'/',
        name:'home',
        component:HomePage
    
    }, 

    {
        path:'/query',
        name: 'query',
        component:QueryPage
    },

    {
        path:'/database',
        name:'database',
        component:AllDatabase
    }
]

const router = createRouter({
    history:createWebHashHistory(),
    routes,
})

export default router;