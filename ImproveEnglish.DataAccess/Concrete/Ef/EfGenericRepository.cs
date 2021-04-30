using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ImproveEnglish.DataAccess.Abstract;

namespace ImproveEnglish.DataAccess.Concrete.Ef
{
    public class EfGenericRepository<TEntity,TContext>:IRepository<TEntity> where TEntity:class where TContext:DbContext, new()
    {
        public TEntity GetById(int id)
        {
            using (var context = new TContext())
            {
                var entity = context.Set<TEntity>().Find(id);
                return entity;
            }
        }

        public List<TEntity> GetAll()
        {
            using (var context = new TContext())
            {
                var entities = context.Set<TEntity>().ToList();
                return entities;
            }
        }

        public void Add(TEntity entity)
        {
            using (var context = new TContext())
            {
                context.Set<TEntity>().Add(entity);
                context.SaveChanges();
            }
        }

        public void Delete(int id)
        {
            using (var context = new TContext())
            {
                var entity = GetById(id);
                context.Set<TEntity>().Attach(entity);
                context.Set<TEntity>().Remove(entity);
                context.SaveChanges();
            }
        }

        public void Update(TEntity entity)
        {
            using (var context = new TContext())
            {
                context.Entry(entity).State = EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}
