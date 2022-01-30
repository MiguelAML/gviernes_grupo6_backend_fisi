import { createPool, Pool } from 'mysql2/promise';

export const connect = async (): Promise<Pool> => {

    const connection = await createPool({
        host: 'red-estudiantil-db.mysql.database.azure.com',
        user: 'redestudiantiladmin',
        password: '1bd346-M',
        database: 'red_estudiantil',
        connectionLimit: 10
    });

    return connection;

}